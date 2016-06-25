class PublicationProfilesController < ApplicationController
  before_action :set_publication_profile, only: [:show, :edit, :update, :destroy]

  # GET /publication_profiles
  # GET /publication_profiles.json
  def index
    @publication_profiles = PublicationProfile.all
  end

  # GET /publication_profiles/1
  # GET /publication_profiles/1.json
  def show
  end

  # GET /publication_profiles/new
  def new
    @publication_profile = PublicationProfile.new
  end

  # GET /publication_profiles/1/edit
  def edit
  end

  # POST /publication_profiles
  # POST /publication_profiles.json
  def create
    @publication_profile = PublicationProfile.new(publication_profile_params)

    respond_to do |format|
      if @publication_profile.save
        format.html { redirect_to @publication_profile, notice: 'Publication profile was successfully created.' }
        format.json { render :show, status: :created, location: @publication_profile }
      else
        format.html { render :new }
        format.json { render json: @publication_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_profiles/1
  # PATCH/PUT /publication_profiles/1.json
  def update
    respond_to do |format|
      if @publication_profile.update(publication_profile_params)
        format.html { redirect_to @publication_profile, notice: 'Publication profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication_profile }
      else
        format.html { render :edit }
        format.json { render json: @publication_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_profiles/1
  # DELETE /publication_profiles/1.json
  def destroy
    @publication_profile.destroy
    respond_to do |format|
      format.html { redirect_to publication_profiles_url, notice: 'Publication profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication_profile
      @publication_profile = PublicationProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_profile_params
      params.require(:publication_profile).permit(:publication_id, :author, :profile_id)
    end
end
