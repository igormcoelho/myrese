class FolderInfohashesController < ApplicationController
  before_action :set_folder_infohash, only: [:show, :edit, :update, :destroy]

  # GET /folder_infohashes
  # GET /folder_infohashes.json
  def index
    @folder_infohashes = FolderInfohash.all
  end

  # GET /folder_infohashes/1
  # GET /folder_infohashes/1.json
  def show
  end

  # GET /folder_infohashes/new
  def new
    @folder_infohash = FolderInfohash.new
  end

  # GET /folder_infohashes/1/edit
  def edit
  end

  # POST /folder_infohashes
  # POST /folder_infohashes.json
  def create
    @folder_infohash = FolderInfohash.new(folder_infohash_params)

    respond_to do |format|
      if @folder_infohash.save
        format.html { redirect_to @folder_infohash, notice: 'Folder infohash was successfully created.' }
        format.json { render :show, status: :created, location: @folder_infohash }
      else
        format.html { render :new }
        format.json { render json: @folder_infohash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folder_infohashes/1
  # PATCH/PUT /folder_infohashes/1.json
  def update
    respond_to do |format|
      if @folder_infohash.update(folder_infohash_params)
        format.html { redirect_to @folder_infohash, notice: 'Folder infohash was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder_infohash }
      else
        format.html { render :edit }
        format.json { render json: @folder_infohash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_infohashes/1
  # DELETE /folder_infohashes/1.json
  def destroy
    @folder_infohash.destroy
    respond_to do |format|
      format.html { redirect_to folder_infohashes_url, notice: 'Folder infohash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder_infohash
      @folder_infohash = FolderInfohash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_infohash_params
      params.require(:folder_infohash).permit(:folder_id, :infohash_id)
    end
end
