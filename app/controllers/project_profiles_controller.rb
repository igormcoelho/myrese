class ProjectProfilesController < ApplicationController
  before_action :set_project, only: [:new, :create, :destroy]

  # GET /project_profiles/new
  def new
    @project_profile = ProjectProfile.new(:project => @project)
  end

  # POST /project_profiles
  # POST /project_profiles.json
  def create
    #@project_profile = PublicationProfile.new(project_profile_params)
    @project_profile = @project.project_profiles.build(project_profile_params)
    
    respond_to do |format|
      if @project_profile.save
        format.html { redirect_to projects_url, notice: 'Author was successfully added.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project_profile.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /project_profiles/1
  # DELETE /project_profiles/1.json
  def destroy
    @project_profile = @project.project_profiles.find(params[:id])
    @project_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Project author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_profile_params
      params.require(:project_profile).permit(:profile_id) #ignoring :project_id
    end
end
