class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def username
    uname = params[:username]
    user = User.where(:username => uname).first
    if(user and user.profile)
      redirect_to profile_url(user.profile)
    else
      redirect_to root_path, alert: "User profile '"+uname+"' not found!"
    end
  end

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.visibility_id = 1 # private
    @profile.quota = 30 # 30MB is the default
    
    clist = @profile.citation.split(/\s*[.,]\s*/)
    
    cite = ""
    clist.each_with_index do |v,index|
      if index == 0
        cite += v.upcase + ", "
      else
        cite += v.upcase[0] + "."
      end
    end
    
    @findprofile = Profile.where(:citation => cite, :user => nil).first

    respond_to do |format|
      if (!current_user.profile) and @findprofile
        @findprofile.user_id = current_user.id
        @findprofile.save
        current_user.profile = @findprofile
        current_user.save
        format.html { redirect_to @findprofile, notice: 'Profile ' + cite + ' was found and linked to your user.' }
        format.json { render :show, status: :created, location: @findprofile }  
      elsif (!current_user.profile) and @profile.save
        current_user.profile = @profile
        current_user.save
        format.html { redirect_to @profile, notice: 'Profile ' + cite + ' was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_update_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:fullname, :shortbio, :citation, :visibility_id)
    end

    def profile_update_params
      params.require(:profile).permit(:fullname, :shortbio, :visibility_id)
    end

end
