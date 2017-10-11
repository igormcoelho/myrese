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
    object.title      = jsonhash["title"]
    object.ctitle     = jsonhash["ctitle"]
    object.pubtype_id = jsonhash["pubtype_id"]
    object.year       = jsonhash["year"]
    
    authorlist = jsonhash["publication_profiles"]
    logger.info authorlist
    logger.info jsonhash["publication_profiles"][0]
    alist = []
    authorlist.each do |a|
      pp = PublicationProfile.new
      pp.author = a["author"]
      pp.orderv = a["orderv"]
      pp.publication = object
      alist.push(pp)
    end
    logger.info alist
    object.publication_profiles = alist
    


    build_infohash(object, jsonhash)
    object.infohash.publication = object

    return object
  end

  # POST /imports
  # POST /imports.json
  def create
    logger.info "================= imports#create"
    @import = Import.new(import_params)
    @import.user_id = current_user.id;
    
    logger.info @import.jsondata
    infohash_data = JSON.parse(@import.jsondata)
    
#https://myrese-imcoelho.c9users.io/api/v1/publications/12.json?username=igormcoelho&user_token=BePvn2hitUsHptpYPqMz

    object = nil

    if (infohash_data["myrese"]=="v1.0")
        logger.info "myrese version 1.0"
        if (infohash_data["htype_id"] == Publication::HTYPE)
           object = build_publication(infohash_data)
        end
        
        if object
          logger.info "will save object!"
          @import.infohash = object.infohash

          if not object.save
            logger.info "after save:"
            logger.info object.errors.messages.as_json
          end
        end
    end

    respond_to do |format|
      if not object.errors.any? #&& @import.save
        logger.info object
        logger.info object.as_json
        
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new }
        format.json { render json: object.errors, status: :unprocessable_entity }
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
      params.require(:import).permit(:jsondata)  #do not use :url
    end
end
