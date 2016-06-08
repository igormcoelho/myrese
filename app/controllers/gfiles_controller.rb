class GfilesController < ApplicationController
  before_action :set_gfile, only: [:show, :edit, :update, :destroy]

  # GET /gfiles
  # GET /gfiles.json
  def index
    @gfiles = Gfile.all
  end

  # GET /gfiles/1
  # GET /gfiles/1.json
  def show
  end

  # GET /gfiles/new
  def new
    @gfile = Gfile.new
  end

  # GET /gfiles/1/edit
  def edit
  end

  # POST /gfiles
  # POST /gfiles.json
  def create
    @gfile = Gfile.new(gfile_params)

    respond_to do |format|
      if @gfile.save
        format.html { redirect_to @gfile, notice: 'Gfile was successfully created.' }
        format.json { render :show, status: :created, location: @gfile }
      else
        format.html { render :new }
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gfiles/1
  # PATCH/PUT /gfiles/1.json
  def update
    respond_to do |format|
      if @gfile.update(gfile_params)
        format.html { redirect_to @gfile, notice: 'Gfile was successfully updated.' }
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
    @gfile.destroy
    respond_to do |format|
      format.html { redirect_to gfiles_url, notice: 'Gfile was successfully destroyed.' }
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
      params.require(:gfile).permit(:name, :description, :size, :infohash_id)
    end
end
