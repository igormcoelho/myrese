class FolderInfohashesController < ApplicationController
  before_action :set_folder, only: [:new, :create, :destroy]

  # GET /folder_infohashes/new
  def new
    @folder_infohash = FolderInfohash.new(:folder => @folder)
  end

  # POST /folder_infohashes
  # POST /folder_infohashes.json
  def create
    @folder_infohash = @folder.folder_infohashes.build(folder_infohash_params)

    respond_to do |format|
      if @folder_infohash.save
        format.html { redirect_to @folder, notice: 'Folder item was successfully created.' }
        format.json { render :show, status: :created, location: @folder_infohash }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_infohashes/1
  # DELETE /folder_infohashes/1.json
  def destroy
    @folder_infohash = @folder.folder_infohashes.find(params[:id])
    @folder_infohash.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_infohash_params
      params.require(:folder_infohash).permit(:infohash_id) #ignoring folder_id
    end
end
