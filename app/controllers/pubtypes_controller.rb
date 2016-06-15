class PubtypesController < ApplicationController
  before_action :set_pubtype, only: [:show, :edit, :update, :destroy]

  # GET /pubtypes
  # GET /pubtypes.json
  def index
    @pubtypes = Pubtype.all
  end

  # GET /pubtypes/1
  # GET /pubtypes/1.json
  def show
  end

  # GET /pubtypes/new
  def new
    @pubtype = Pubtype.new
  end

  # GET /pubtypes/1/edit
  def edit
  end

  # POST /pubtypes
  # POST /pubtypes.json
  def create
    @pubtype = Pubtype.new(pubtype_params)

    respond_to do |format|
      if @pubtype.save
        format.html { redirect_to @pubtype, notice: 'Pubtype was successfully created.' }
        format.json { render :show, status: :created, location: @pubtype }
      else
        format.html { render :new }
        format.json { render json: @pubtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pubtypes/1
  # PATCH/PUT /pubtypes/1.json
  def update
    respond_to do |format|
      if @pubtype.update(pubtype_params)
        format.html { redirect_to @pubtype, notice: 'Pubtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @pubtype }
      else
        format.html { render :edit }
        format.json { render json: @pubtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pubtypes/1
  # DELETE /pubtypes/1.json
  def destroy
    @pubtype.destroy
    respond_to do |format|
      format.html { redirect_to pubtypes_url, notice: 'Pubtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pubtype
      @pubtype = Pubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pubtype_params
      params.require(:pubtype).permit(:name)
    end
end
