class InforelationsController < ApplicationController
  before_action :set_inforelation, only: [:show, :edit, :update, :destroy]

  # GET /inforelations
  # GET /inforelations.json
  def index
    @inforelations = Inforelation.all
  end

  # GET /inforelations/1
  # GET /inforelations/1.json
  def show
  end

  # GET /inforelations/new
  def new
    @inforelation = Inforelation.new
  end

  # GET /inforelations/1/edit
  def edit
  end

  # POST /inforelations
  # POST /inforelations.json
  def create
    @inforelation = Inforelation.new(inforelation_params)

    respond_to do |format|
      if @inforelation.save
        format.html { redirect_to @inforelation, notice: 'Inforelation was successfully created.' }
        format.json { render :show, status: :created, location: @inforelation }
      else
        format.html { render :new }
        format.json { render json: @inforelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inforelations/1
  # PATCH/PUT /inforelations/1.json
  def update
    respond_to do |format|
      if @inforelation.update(inforelation_params)
        format.html { redirect_to @inforelation, notice: 'Inforelation was successfully updated.' }
        format.json { render :show, status: :ok, location: @inforelation }
      else
        format.html { render :edit }
        format.json { render json: @inforelation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inforelations/1
  # DELETE /inforelations/1.json
  def destroy
    @inforelation.destroy
    respond_to do |format|
      format.html { redirect_to inforelations_url, notice: 'Inforelation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inforelation
      @inforelation = Inforelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inforelation_params
      params.require(:inforelation).permit(:infohash1, :infohash2)
    end
end
