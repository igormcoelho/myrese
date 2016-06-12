class HtypesController < ApplicationController
  before_action :set_htype, only: [:show, :edit, :update, :destroy]

  # GET /htypes
  # GET /htypes.json
  def index
    @htypes = Htype.all
  end

  # GET /htypes/1
  # GET /htypes/1.json
  def show
  end

  # GET /htypes/new
  def new
    @htype = Htype.new
  end

  # GET /htypes/1/edit
  def edit
  end

  # POST /htypes
  # POST /htypes.json
  def create
    @htype = Htype.new(htype_params)

    respond_to do |format|
      if @htype.save
        format.html { redirect_to @htype, notice: 'Htype was successfully created.' }
        format.json { render :show, status: :created, location: @htype }
      else
        format.html { render :new }
        format.json { render json: @htype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /htypes/1
  # PATCH/PUT /htypes/1.json
  def update
    respond_to do |format|
      if @htype.update(htype_params)
        format.html { redirect_to @htype, notice: 'Htype was successfully updated.' }
        format.json { render :show, status: :ok, location: @htype }
      else
        format.html { render :edit }
        format.json { render json: @htype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /htypes/1
  # DELETE /htypes/1.json
  def destroy
    @htype.destroy
    respond_to do |format|
      format.html { redirect_to htypes_url, notice: 'Htype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_htype
      @htype = Htype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def htype_params
      params.require(:htype).permit(:name)
    end
end
