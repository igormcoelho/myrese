class PublicationProfilesController < ApplicationController
  #before_action :set_publication_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_publication, only: [:new, :create, :destroy]

  # GET /publication_profiles
  # GET /publication_profiles.json
  #def index
  #  @publication_profiles = PublicationProfile.all
  #end

  # GET /publication_profiles/1
  # GET /publication_profiles/1.json
  #def show
  #end

  # GET /publication_profiles/new
  def new
    #@publication_profile = PublicationProfile.new
    @publication_profile = PublicationProfile.new(:publication => @publication)
  end

  # GET /publication_profiles/1/edit
  #def edit
  #end

  # POST /publication_profiles
  # POST /publication_profiles.json
  def create
    #@publication_profile = PublicationProfile.new(publication_profile_params)
    @publication_profile = @publication.publication_profiles.build(publication_profile_params)
    if (@publication_profile.profile_id > 0)
       @publication_profile.author = Profile.find(@publication_profile.profile_id).citation
    elsif (@publication_profile.profile_id == 0) and (@publication_profile.author != "")
       @publication_profile.author
       @publication_profile.profile = nil # maybe redundant...
    elsif (@publication_profile.profile_id == -1) and (@publication_profile.author != "")
      clist = @publication_profile.author.split(/\s*[.,]\s*/)
      cite = ""
      clist.each_with_index do |v,index|
        if index == 0
          cite += v.upcase + ", "
        else
          cite += v.upcase[0] + "."
        end
      end
      @publication_profile.profile = Profile.new(:fullname => cite, :shortbio => "no story...", :visibility_id => 1, :citation => cite)
      @publication_profile.profile.save
      @publication_profile.author = cite
    else # crazy!
      @publication_profile.profile = nil
      @publication_profile.author = ""
    end

    respond_to do |format|
      if @publication_profile.save
        format.html { redirect_to publications_url, notice: 'Author was successfully added.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication_profile.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /publication_profiles/1
  # DELETE /publication_profiles/1.json
  def destroy
    @publication_profile = @publication.publication_profiles.find(params[:id])
    @publication_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to @publication, notice: 'Publication profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_publication_profile
    #  @publication_profile = PublicationProfile.find(params[:id])
    #end
    
    def set_publication
      @publication = Publication.find(params[:publication_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_profile_params
      params.require(:publication_profile).permit(:author, :profile_id) #ignoring :publication_id
    end
end
