class ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]
  
  require 'json'
  require 'open-uri'
  require 'httparty'

  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports
  # POST /imports.json
  def create
    @import = Import.new(import_params)
    @import.user_id = current_user.id;
    
    logger.info "loading..."
    logger.info @import.url
    #@import.jsondata = JSON.load(open(URI.parse(@import.url), "User-Agent" => "Headless", :proxy => nil ))
    logger.info URI.parse(@import.url)
    resp = HTTParty.get(URI.parse(@import.url), headers: {"User-Agent" => "Headless"})
    resp = HTTParty.get(URI.parse(var), headers: {"User-Agent" => "Headless"})
    user_data = JSON.parse(resp.response)
    logger.info user_data

#https://myrese-imcoelho.c9users.io/api/v1/publications/12.json?username=igormcoelho&user_token=BePvn2hitUsHptpYPqMz


    respond_to do |format|
      if @import.save
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:import).permit(:url, :jsondata)
    end
end
