class ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]
  
  require 'json'
  
  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/doimport/*ipath (as ipath)
  def doimport
    @import = Import.new
    @import.url = params[:ipath]
    
    render :new
  end

  # GET /imports/1/edit
  def edit
  end
  
  def build_infohash(object, jsonhash)
    object.infohash = Infohash.new
    object.infohash.user           = current_user
    object.infohash.gtitle         = jsonhash["gtitle"]
    object.infohash.gdescription   = jsonhash["gdescription"]    
    object.infohash.htype_id       = jsonhash["htype_id"]   
    object.infohash.visibility_id  = jsonhash["visibility_id"] 
  end
  
  
  

  
  def build_publication(jsonhash)
    logger.info "building publication"
    object = Publication.new
    object.title        = jsonhash["title"]
    object.ctitle       = jsonhash["ctitle"]
    object.pubtype_id   = jsonhash["pubtype_id"]
    object.year         = jsonhash["year"]
    object.issn         = jsonhash["issn"]
    object.isbn         = jsonhash["isbn"]
    object.editor       = jsonhash["editor"]
    object.publisher    = jsonhash["publisher"]
    object.organization = jsonhash["organization"]
    object.address      = jsonhash["address"]
    object.month        = jsonhash["month"]
    object.volume       = jsonhash["volume"]
    object.number       = jsonhash["number"]
    object.series       = jsonhash["series"]
    object.page_begin   = jsonhash["page_begin"]
    object.page_end     = jsonhash["page_end"]
    object.howpublished = jsonhash["howpublished"]
    object.doi          = jsonhash["doi"]
    object.keywords     = jsonhash["keywords"]
    object.other        = jsonhash["other"]

    authorlist = jsonhash["publication_profiles"]
    alist = []
    authorlist.each do |a|
      pp = PublicationProfile.new
      pp.author = a["author"]
      pp.orderv = a["orderv"]
      pp.publication = object
      alist.push(pp)
    end
    object.publication_profiles = alist

    build_infohash(object, jsonhash)
    object.infohash.publication = object

    return object
  end


  # http://paoloibarra.com/2014/09/27/Image-Upload-Using-Rails-API-And-Paperclip/
  # This part is actually taken from http://blag.7tonlnu.pl/blog/2014/01/22/uploading-images-to-a-rails-app-via-json-api. I tweaked it a bit by manually setting the tempfile's content type because somehow putting it in a hash during initialization didn't work for me.
  def parse_file_data(file_data_b64, file_name, content_type)
    @tempfile = Tempfile.new('gfile_tmp')
    @tempfile.binmode
    @tempfile.write Base64.decode64(Base64.decode64(file_data_b64))
    @tempfile.rewind

    uploaded_file = ActionDispatch::Http::UploadedFile.new(
      tempfile: @tempfile,
      filename: file_name
    )

    uploaded_file.content_type = content_type
    uploaded_file
  end
  
  # http://paoloibarra.com/2014/09/27/Image-Upload-Using-Rails-API-And-Paperclip/
  def clean_tempfile
    if @tempfile
      @tempfile.close
      @tempfile.unlink
    end
  end
  
  
  def build_gfile(jsonhash)
    logger.info "building gfile"
    fileobject = parse_file_data(import_params["url"], jsonhash["filename_file_name"], jsonhash["filename_content_type"])
    
    gfile = Gfile.new
    gfile.filename = fileobject
    
    build_infohash(gfile, jsonhash)
    gfile.infohash.gfile = gfile

    return gfile
  ensure
    clean_tempfile
  end



  # POST /imports
  # POST /imports.json
  def create
    @import = Import.new(import_params)
    @import.user_id = current_user.id;
    @import.url = ""  # never store url
    
    logger.info @import.jsondata
    if (@import.jsondata == "") || (@import.jsondata[0]!='{')
      @import.jsondata = "{}"
    end
    infohash_data = JSON.parse(@import.jsondata)
    
    object = nil

    if (infohash_data["myrese"]=="v1.0")
        logger.info "myrese version 1.0"
        if (infohash_data["htype_id"] == Publication::HTYPE)
           object = build_publication(infohash_data)
        end
        
        if (infohash_data["htype_id"] == Gfile::HTYPE)
          object = build_gfile(infohash_data)
        end
        
        if object
          @import.infohash = object.infohash

          if not object.save
            logger.info "after save:"
            logger.info object.errors.messages.as_json
          end
        end
    elsif (infohash_data["curriculo_lattes"])
      logger.info "scriptLattes!"
       
      pesqs = infohash_data["curriculo_lattes"]["pesquisador"]
      if pesqs.class == Hash then
        pesqs = []
        pesqs.push infohash_data["curriculo_lattes"]["pesquisador"]
      end
      pesqs.each do |pesq|
        
        papers = []
        if pesq.has_value?("artigos_em_periodicos") then
          papers = pesq["artigos_em_periodicos"]["artigo"]
        end
        if papers.class == Hash then
          papers = []
          papers.push pesq["artigos_em_periodicos"]["artigo"]
        end
        papers.each do |paper|
          
          logger.info pesq["identificacao"]["nome_inicial"] + " => " + paper["titulo"]

          pplist = []
          orderv = 1
          paper["autores"].split(";").each do |autor|
            autor.strip!
            pplist.push({'author' => autor, 'orderv' => orderv})
            orderv+=1
          end

          #logger.info "pplist:"+pplist
          pubhash = {
            'gtitle'      => paper["titulo"], # for infohash
            'gdescription'  => paper["titulo"], # for infohash
            'visibility_id' => 3, #PUBLIC # for infohash
            'htype_id'      => 1, #PUBLICATION # for infohash
            'title'      => paper["titulo"],
            'ctitle'     => paper["revista"],
            'year'       => paper["ano"],
            'volume'     => paper["volume"],
            'number'     => paper["numero"],
            'doi'        => paper["doi"],
            'page_begin' => paper["paginas"].split("-")[0],
            'page_end'   => paper["paginas"].split("-")[1],
            'publication_profiles' => pplist, 
            'pubtype_id' => 1, # article
          }
          
          #pubhash["publication_profiles"] = JSON[pubhash["publication_profiles"]]
          
          if Publication.joins(:infohash).where("infohashes.user_id = ?", current_user.id).where(:title => paper["titulo"]).length > 0 then
            #logger.info ""
            logger.info "REPETIDO"
            #logger.info JSON[pubhash]
            #logger.info ""
          else
            object = build_publication(pubhash)
            if object
              @import.infohash = object.infohash

              if not object.save
                logger.info "after save:"
                logger.info object.errors.messages.as_json
              end
            end
            object = nil # start again
          end

        end  # artigos em periodicos


        conferences = []
        if pesq.has_value?("trabalho_completo_congresso") then
          conferences = pesq["trabalho_completo_congresso"]["trabalho_completo"]
        end
        if conferences.class == Hash then
          conferences = []
          conferences.push pesq["trabalho_completo_congresso"]["trabalho_completo"]
        end
        conferences.each do |paper|
          logger.info pesq["identificacao"]["nome_inicial"] + " => " + paper["titulo"]

          pplist = []
          orderv = 1
          paper["autores"].split(";").each do |autor|
            autor.strip!
            pplist.push({'author' => autor, 'orderv' => orderv})
            orderv+=1 
          end

          #logger.info "pplist:"+pplist
          pubhash = {
            'gtitle'      => paper["titulo"], # for infohash
            'gdescription'  => paper["titulo"], # for infohash
            'visibility_id' => 3, #PUBLIC # for infohash
            'htype_id'      => 1, #PUBLICATION # for infohash
            'title'      => paper["titulo"],
            'ctitle'     => paper["nome_evento"],
            'year'       => paper["ano"],
            'volume'     => paper["volume"],
            'doi'        => paper["doi"],
            'page_begin' => paper["paginas"].split("-")[0],
            'page_end'   => paper["paginas"].split("-")[1],
            'publication_profiles' => pplist, 
            'pubtype_id' => 5, # inproceedings
          }
          
          #pubhash["publication_profiles"] = JSON[pubhash["publication_profiles"]]
          
          if Publication.joins(:infohash).where("infohashes.user_id = ?", current_user.id).where(:title => paper["titulo"]).length > 0 then
            #logger.info ""
            logger.info "REPETIDO"
            #logger.info JSON[pubhash]
            #logger.info ""
          else
            object = build_publication(pubhash)
            if object
              @import.infohash = object.infohash

              if not object.save
                logger.info "after save:"
                logger.info object.errors.messages.as_json
              end
            end
            object = nil # start again
          end

        end  # conferencias
        
        chapters = []
        if pesq.has_value?("capitulos_livros") then
          chapters = pesq["capitulos_livros"]["capitulo"]
        end
        if chapters.class == Hash then
          chapters = []
          chapters.push pesq["capitulos_livros"]["capitulo"]
        end
        chapters.each do |paper|
          logger.info paper
          logger.info pesq["identificacao"]["nome_inicial"] + " => " + paper["titulo"]

          pplist = []
          orderv = 1
          paper["autores"].split(";").each do |autor|
            autor.strip!
            pplist.push({'author' => autor, 'orderv' => orderv})
            orderv+=1
          end

          #logger.info "pplist:"+pplist
          pubhash = {
            'gtitle'      => paper["titulo"], # for infohash
            'gdescription'  => paper["titulo"], # for infohash
            'visibility_id' => 3, #PUBLIC # for infohash
            'htype_id'      => 1, #PUBLICATION # for infohash
            'title'      => paper["titulo"],
            'ctitle'     => paper["livro"],
            'year'       => paper["ano"],
            'volume'     => paper["volume"],
            'publisher'  => paper["editora"],
            'series'     => paper["edicao"],
            'page_begin' => paper["paginas"].split("-")[0],
            'page_end'   => paper["paginas"].split("-")[1],
            'publication_profiles' => pplist, 
            'pubtype_id' => 4, # chapter
          }
          
          #pubhash["publication_profiles"] = JSON[pubhash["publication_profiles"]]
          
          if Publication.joins(:infohash).where("infohashes.user_id = ?", current_user.id).where(:title => paper["titulo"]).length > 0 then
            #logger.info ""
            logger.info "REPETIDO"
            #logger.info JSON[pubhash]
            #logger.info ""
          else
            object = build_publication(pubhash)
            if object
              @import.infohash = object.infohash

              if not object.save
                logger.info "after save:"
                logger.info object.errors.messages.as_json
              end
            end
            object = nil # start again
          end

        end  # capitulo livro

      end # pesquisador
    end # scriptLattes
    
    @import.url = ""  # never store url
    respond_to do |format|
      if (object && (not object.errors.any?))
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new }
        jsontext = nil
        if object
          jsontext = object.errors
        end
        format.json { render json: jsontext, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:import).permit(:jsondata, :url)  #using :url to carry file data (TODO: fix)
    end
end
