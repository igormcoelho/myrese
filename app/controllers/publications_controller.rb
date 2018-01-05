class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, :only => [:indexbyuser, :show]

  # GET /publications
  # GET /publications.json
  def index
    #@publications = Publication.all
    
    # AUTOMATIC JOIN
    #@publications = Publication.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id).or(
    #                Publication.joins(:infohash_users).joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    #).uniq
    # SELECT "publications".* FROM "publications" INNER JOIN "infohashes" ON "infohashes"."id" = "publications"."infohash_id" 
    # INNER JOIN "infohash_users" ON "infohash_users"."infohash_id" = "infohashes"."id" INNER JOIN "infohashes" "infohashes_publications" ON "infohashes_publications"."id" = "publications"."infohash_id" 
    # WHERE ((infohash_users.user_id = 1) OR (infohashes.user_id = 1))
    
    #MANUAL JOIN
    @publications  = Publication.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @publications += Publication.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @publications.uniq!
    #@publications.order('year DESC')
    @publications.sort_by!{|pub| -pub[:year] }
    
  end
  
  def indexbyuser
    #@publications = Publication.all
    
    # AUTOMATIC JOIN
    #@publications = Publication.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id).or(
    #                Publication.joins(:infohash_users).joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    #).uniq
    # SELECT "publications".* FROM "publications" INNER JOIN "infohashes" ON "infohashes"."id" = "publications"."infohash_id" 
    # INNER JOIN "infohash_users" ON "infohash_users"."infohash_id" = "infohashes"."id" INNER JOIN "infohashes" "infohashes_publications" ON "infohashes_publications"."id" = "publications"."infohash_id" 
    # WHERE ((infohash_users.user_id = 1) OR (infohashes.user_id = 1))
    
    userid = User.where(:username => params['uname']).first
    
    #MANUAL JOIN
    @publications  = Publication.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ? AND infohashes.visibility_id = ?", userid.id, 3)
    @publications += Publication.joins(:infohash).where("infohashes.user_id = ? AND infohashes.visibility_id = ?", userid.id, 3)
    @publications.uniq!
    
    render action: "index", notice: 'Listing publications for '+params['uname']
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @infohash    = Infohash.new
    @publication.infohash = @infohash
  end

  # GET /publications/1/edit
  def edit
    @infohash = @publication.infohash
  end

  # POST /publications
  # POST /publications.json
  def create
    #@publication = Publication.new(publication_params)
    @infohash    = Infohash.new(infohash_params)
    @publication = @infohash.build_publication(publication_params)
    
    #@mainauthor = params.require(:publication).permit(:mainauthor)

    @infohash.user = current_user
    @infohash.htype_id = Publication::HTYPE  # PUBLICATION
    @infohash.code     = "pub" + Publication.count.to_s
          
    respond_to do |format|
      #if !@publication.valid?
      #  format.html { render :new }
      #  format.json { render json: @infohash.errors, status: :unprocessable_entity }
      #elsif @publication.save
      if @publication.save
        #@infohash.save
        PublicationProfile.create(:profile => current_user.profile, :author => current_user.profile.citation, :publication => @publication)
        
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      @publication.infohash.assign_attributes(infohash_params)
      @infohash = @publication.infohash
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.infohash.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:pubtype_id, :title, :year, :ctitle, :issn, :isbn, :editor, :publisher, :organization, :address, :month, :volume, :number, :series, :page_begin, :page_end, :howpublished, :doi, :keywords, :other)
    end
    
    def infohash_params
      params.require(:publication).permit(:gtitle, :gdescription, :visibility_id)
    end
end
