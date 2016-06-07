class VisibilitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_visibility, only: [:show, :edit, :update, :destroy]
  #before_filter :require_permission, only: [:edit, :update, :destroy]

  # GET /visibilities
  # GET /visibilities.json
  def index
    @visibilities = Visibility.all
  end

  # GET /visibilities/1
  # GET /visibilities/1.json
  def show
  end

  # GET /visibilities/new
  def new
    @visibility = Visibility.new
  end

  # GET /visibilities/1/edit
  def edit
  end

  # POST /visibilities
  # POST /visibilities.json
  def create
    @visibility = Visibility.new(visibility_params)

    respond_to do |format|
      if @visibility.save
        format.html { redirect_to @visibility, notice: 'Visibility was successfully created.' }
        format.json { render :show, status: :created, location: @visibility }
      else
        format.html { render :new }
        format.json { render json: @visibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visibilities/1
  # PATCH/PUT /visibilities/1.json
  def update
    respond_to do |format|
      if @visibility.update(visibility_params)
        format.html { redirect_to @visibility, notice: 'Visibility was successfully updated.' }
        format.json { render :show, status: :ok, location: @visibility }
      else
        format.html { render :edit }
        format.json { render json: @visibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visibilities/1
  # DELETE /visibilities/1.json
  def destroy
    @visibility.destroy
    respond_to do |format|
      format.html { redirect_to visibilities_url, notice: 'Visibility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visibility
      @visibility = Visibility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visibility_params
      params.require(:visibility).permit(:type)
    end
end
