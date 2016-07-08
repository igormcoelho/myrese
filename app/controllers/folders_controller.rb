class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    #@folders = Folder.all
    
    @folders  = Folder.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @folders += Folder.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @folders.uniq!
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @infohash = @folder.infohash
  end

  # GET /folders/new
  def new
    @folder = Folder.new
    @infohash    = Infohash.new
    @folder.infohash = @infohash
  end

  # GET /folders/1/edit
  def edit
    @infohash = @folder.infohash
  end

  # POST /folders
  # POST /folders.json
  def create
    #@folder = Folder.new(folder_params)
    @infohash    = Infohash.new(infohash_params)
    @folder = @infohash.build_folder(folder_params)
    
    @infohash.user = current_user
    @infohash.htype_id = Folder::HTYPE
    @infohash.code     = "fold" + Folder.count.to_s

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      @folder.infohash.assign_attributes(infohash_params)
      @infohash = @folder.infohash
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.infohash.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:filter_pattern)
    end
    
    def infohash_params
      params.require(:folder).permit(:gtitle, :gdescription, :visibility_id)
    end
end
