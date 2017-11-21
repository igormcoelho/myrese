class InfohashesController < ApplicationController
  before_action :set_infohash, only: [:show, :edit, :update, :destroy]
  
  include InfohashesHelper

  def code
    hcode = params[:code]
    ih = Infohash.where(:code => hcode).first
    @infohash = ih
    if(ih)
      p = get_item_path(ih)
      if(p != "")
        respond_to do |format|
          format.html { redirect_to p }
          format.json { render :show, location: p }
        end
      else
        redirect_to root_path, alert: "Item '"+hcode+"' not found!"
      end
    else
      redirect_to root_path, alert: "Item '"+hcode+"' not found!"
    end
  end

  # GET /infohashes
  # GET /infohashes.json
  def index
    #@infohashes = Infohash.all
    @infohashes = Infohash.where(:user => current_user)
  end

  # GET /infohashes/1
  # GET /infohashes/1.json
  def show
  end

  # GET /infohashes/new
  def new
    @infohash = Infohash.new
  end

  # GET /infohashes/1/edit
  def edit
  end

  # POST /infohashes
  # POST /infohashes.json
  def create
    @infohash = Infohash.new(infohash_params)
    @infohash.user = current_user

    respond_to do |format|
      if @infohash.save
        format.html { redirect_to @infohash, notice: 'Infohash was successfully created.' }
        format.json { render :show, status: :created, location: @infohash }
      else
        format.html { render :new }
        format.json { render json: @infohash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infohashes/1
  # PATCH/PUT /infohashes/1.json
  def update
    respond_to do |format|
      if @infohash.update(infohash_params)
        format.html { redirect_to @infohash, notice: 'Infohash was successfully updated.' }
        format.json { render :show, status: :ok, location: @infohash }
      else
        format.html { render :edit }
        format.json { render json: @infohash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infohashes/1
  # DELETE /infohashes/1.json
  def destroy
    @infohash.destroy
    respond_to do |format|
      format.html { redirect_to infohashes_url, notice: 'Infohash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infohash
      @infohash = Infohash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infohash_params
      params.require(:infohash).permit(:code, :visibility_id, :user_id, :group_id, :htype_id, :gtitle, :gdescription)
    end
end
