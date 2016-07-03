class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects  = Project.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @projects += Project.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @projects.uniq!
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @infohash    = Infohash.new
    @project.infohash = @infohash
  end

  # GET /projects/1/edit
  def edit
    @infohash = @publication.infohash
  end

  # POST /projects
  # POST /projects.json
  def create
    @infohash    = Infohash.new(infohash_params)
    @project = @infohash.build_project(project_params)

    @infohash.user     = current_user
    @infohash.htype_id = Project::HTYPE
    @infohash.code     = "proj" + Project.count.to_s

    respond_to do |format|
      if @project.save
        ProjectProfile.create(:profile => current_user.profile, :project => @project)

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      @project.infohash.assign_attributes(infohash_params)
      @project.assign_attributes(project_params)
      if @project.profile_id == 0
        @project.profile = nil
      end
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.infohash.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :abstract, :keywords, :profile_id)
    end
    
    def infohash_params
      params.require(:project).permit(:gtitle, :gdescription, :visibility_id)
    end
end
