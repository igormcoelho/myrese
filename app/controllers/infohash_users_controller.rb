class InfohashUsersController < ApplicationController
  #before_action :set_infohash_user, only: [:show, :edit, :update, :destroy]
  before_action :set_infohash, only: [:new, :create, :destroy]

  # GET /infohash_users
  # GET /infohash_users.json
  #def index
  #  @infohash_users = InfohashUser.all
  #end

  # GET /infohash_users/1
  # GET /infohash_users/1.json
  #def show
  #end

  # GET /infohash_users/new
  #def new
  #  @infohash_user = InfohashUser.new(:infohash => @infohash)
  #end

  # GET /infohash_users/1/edit
  #def edit
  #end

  # POST /infohash_users
  # POST /infohash_users.json
  def create
    #@infohash_user = InfohashUser.new(infohash_user_params)
    @infohash_user = @infohash.infohash_users.build(infohash_user_params)

    respond_to do |format|
      if @infohash_user.save
        if @infohash.htype_id == 1
          @publication = Publication.where(:infohash => @infohash).first
          format.html { redirect_to @publication, notice: 'Infohash user was successfully created.' }
        else
          format.html { redirect_to @infohash, notice: 'Infohash user was successfully created.' }
        end
          format.json { render :show, status: :created, location: @infohash }
      else
        format.html { render :new }
        format.json { render json: @infohash.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /infohash_users/1
  # DELETE /infohash_users/1.json
  def destroy
    @infohash_user = @infohash.infohash_users.find(params[:id])
    @infohash_user.destroy
    
    respond_to do |format|
      #todo fxi
      @publication = Publication.where(:infohash => @infohash).first
      format.html { redirect_to @publication, notice: 'Infohash user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_infohash_user
    #  @infohash_user = InfohashUser.find(params[:id])
    #end
    
    def set_infohash
      @infohash = Infohash.find(params[:infohash_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infohash_user_params
      params.require(:infohash_user).permit(:user_id)  #ignoring infohash_id
    end
end
