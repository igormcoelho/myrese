class PauthorsController < ApplicationController
  before_action :set_pauthor, only: [:show, :edit, :update, :destroy]

  # GET /pauthors
  # GET /pauthors.json
  def index
    @pauthors = Pauthor.all
  end

  # GET /pauthors/1
  # GET /pauthors/1.json
  def show
  end

  # GET /pauthors/new
  def new
    @pauthor = Pauthor.new
  end

  # GET /pauthors/1/edit
  def edit
  end

  # POST /pauthors
  # POST /pauthors.json
  def create
    @pauthor = Pauthor.new(pauthor_params)

    respond_to do |format|
      if @pauthor.save
        format.html { redirect_to @pauthor, notice: 'Pauthor was successfully created.' }
        format.json { render :show, status: :created, location: @pauthor }
      else
        format.html { render :new }
        format.json { render json: @pauthor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pauthors/1
  # PATCH/PUT /pauthors/1.json
  def update
    respond_to do |format|
      if @pauthor.update(pauthor_params)
        format.html { redirect_to @pauthor, notice: 'Pauthor was successfully updated.' }
        format.json { render :show, status: :ok, location: @pauthor }
      else
        format.html { render :edit }
        format.json { render json: @pauthor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pauthors/1
  # DELETE /pauthors/1.json
  def destroy
    @pauthor.destroy
    respond_to do |format|
      format.html { redirect_to pauthors_url, notice: 'Pauthor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pauthor
      @pauthor = Pauthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pauthor_params
      params.require(:pauthor).permit(:publication_id, :user_id)
    end
end
