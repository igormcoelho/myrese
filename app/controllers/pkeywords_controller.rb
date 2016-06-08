class PkeywordsController < ApplicationController
  before_action :set_pkeyword, only: [:show, :edit, :update, :destroy]

  # GET /pkeywords
  # GET /pkeywords.json
  def index
    @pkeywords = Pkeyword.all
  end

  # GET /pkeywords/1
  # GET /pkeywords/1.json
  def show
  end

  # GET /pkeywords/new
  def new
    @pkeyword = Pkeyword.new
  end

  # GET /pkeywords/1/edit
  def edit
  end

  # POST /pkeywords
  # POST /pkeywords.json
  def create
    @pkeyword = Pkeyword.new(pkeyword_params)

    respond_to do |format|
      if @pkeyword.save
        format.html { redirect_to @pkeyword, notice: 'Pkeyword was successfully created.' }
        format.json { render :show, status: :created, location: @pkeyword }
      else
        format.html { render :new }
        format.json { render json: @pkeyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pkeywords/1
  # PATCH/PUT /pkeywords/1.json
  def update
    respond_to do |format|
      if @pkeyword.update(pkeyword_params)
        format.html { redirect_to @pkeyword, notice: 'Pkeyword was successfully updated.' }
        format.json { render :show, status: :ok, location: @pkeyword }
      else
        format.html { render :edit }
        format.json { render json: @pkeyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pkeywords/1
  # DELETE /pkeywords/1.json
  def destroy
    @pkeyword.destroy
    respond_to do |format|
      format.html { redirect_to pkeywords_url, notice: 'Pkeyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pkeyword
      @pkeyword = Pkeyword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pkeyword_params
      params.require(:pkeyword).permit(:publication_id, :infohash_id, :keyword)
    end
end
