class GfilesController < ApplicationController
  before_action :set_gfile, only: [:show, :edit, :update, :destroy]

  # GET /gfiles
  # GET /gfiles.json
  def index
    #@gfiles = Gfile.all
    @gfiles  = Gfile.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @gfiles += Gfile.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @gfiles.uniq!
  end

  # GET /gfiles/1
  # GET /gfiles/1.json
  def show
  end

  # GET /gfiles/new
  def new
    @gfile = Gfile.new
    @infohash    = Infohash.new
    @gfile.infohash = @infohash
  end

  # GET /gfiles/1/edit
  def edit
    @infohash = @gfile.infohash
  end

  # POST /gfiles
  # POST /gfiles.json
  def create
    #@publication = Publication.new(publication_params)
    @infohash  = Infohash.new(infohash_params)
    @gfile     = @infohash.build_gfile(gfile_params)
    
    #@mainauthor = params.require(:publication).permit(:mainauthor)

    @infohash.user = current_user
    @infohash.htype_id = Gfile::HTYPE    # GFILE
    @infohash.code     = "file" + Gfile.count.to_s

   respond_to do |format|
      if current_user.profile.quota_usage+(@gfile.filename_file_size/(1024*1024)) > current_user.profile.quota
        flash[:error] = "User quota is exceeded! "+current_user.profile.quota_usage.to_s+" MB > "+current_user.profile.quota.to_s+" MB"
        format.html { render :new }
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      elsif @gfile.save
        format.html { redirect_to @gfile, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        #flash[:error] = "PROBLEMAS! BUG NO FIREFOX??"
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gfiles/1
  # PATCH/PUT /gfiles/1.json
  def update
    respond_to do |format|
      @gfile.infohash.assign_attributes(infohash_params)
      if @gfile.update(gfile_params)
        format.html { redirect_to @gfile, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @gfile }
      else
        format.html { render :edit }
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gfiles/1
  # DELETE /gfiles/1.json
  def destroy
    @gfile.infohash.destroy
    respond_to do |format|
      format.html { redirect_to gfiles_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gfile
      @gfile = Gfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gfile_params
      params.require(:gfile).permit(:filename)
    end
    
    def infohash_params
      params.require(:gfile).permit(:gtitle, :gdescription, :visibility_id)
    end
end
