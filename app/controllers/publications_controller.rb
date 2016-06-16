class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
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
  end

  # POST /publications
  # POST /publications.json
  def create
    #@publication = Publication.new(publication_params)
    @infohash    = Infohash.new(infohash_params)
    @publication = @infohash.build_publication(publication_params)

    @infohash.user = current_user
    @infohash.htype_id = 1           # PUBLICATION
    @infohash.code     = "pub" + Publication.count.to_s
          
    respond_to do |format|
      if !@infohash.valid?
        @publication.valid?
        format.html { render :new }
        format.json { render json: @infohash.errors, status: :unprocessable_entity }
      elsif @publication.save
        @infohash.save
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
    @publication.destroy
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
      params.require(:publication).permit(:pubtype_id, :title, :journal, :year, :doi, :other)
    end
    def infohash_params
      params.require(:publication).permit(:gtitle, :gdescription, :visibility_id, :group_id)
    end
end
