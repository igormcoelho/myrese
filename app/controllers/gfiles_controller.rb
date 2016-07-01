class GfilesController < ApplicationController
  before_action :set_gfile, only: [:show, :edit, :update, :destroy]

  # GET /gfiles
  # GET /gfiles.json
  def index
    #@gfiles = Gfile.all
    @gfiles       = Gfile.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id).or(
                    Gfile.joins(:infohash_users).joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    ).uniq
  end

  # GET /gfiles/1
  # GET /gfiles/1.json
  def show
  end

  # GET /gfiles/new
  def new
    @gfile = Gfile.new
    @infohash    = Infohash.new
    @gfile.infohash = @infohash
  end

  # GET /gfiles/1/edit
  def edit
    @infohash = @gfile.infohash
  end

  # POST /gfiles
  # POST /gfiles.json
  def create
    #@publication = Publication.new(publication_params)
    @infohash  = Infohash.new(infohash_params)
    @gfile     = @infohash.build_gfile(gfile_params)
    
    #@mainauthor = params.require(:publication).permit(:mainauthor)

    @infohash.user = current_user
    @infohash.htype_id = 2           # GFILE
    @infohash.code     = "file" + Gfile.count.to_s

   respond_to do |format|
      if !@infohash.valid?
        @gfile.valid?
        format.html { render :new }
        format.json { render json: @infohash.errors, status: :unprocessable_entity }
      elsif @gfile.save
        @infohash.save
        InfohashUser.create(:user => current_user, :infohash => @infohash)

        # get hashtags
        lhash  = @infohash.gtitle.scan(/\B#\w+/) #scan(/#\S+/)
        lhash += @infohash.gdescription.scan(/\B#\w+/) #scan(/#\S+/)
        lhash = lhash.uniq     # remove repetitions
        
        # insert only unique
        ActiveRecord::Base.transaction do
          lhash.each do |h|
            Tag.create(:tagname => h.downcase, :infohash => @infohash)
          end
        end
        
        format.html { redirect_to @gfile, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gfiles/1
  # PATCH/PUT /gfiles/1.json
  def update
    respond_to do |format|
      if @gfile.update(gfile_params)
        format.html { redirect_to @gfile, notice: 'Gfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @gfile }
      else
        format.html { render :edit }
        format.json { render json: @gfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gfiles/1
  # DELETE /gfiles/1.json
  def destroy
    @gfile.infohash.destroy
    respond_to do |format|
      format.html { redirect_to gfiles_url, notice: 'Gfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gfile
      @gfile = Gfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gfile_params
      params.require(:gfile).permit(:filename)
    end
    
    def infohash_params
      params.require(:gfile).permit(:gtitle, :gdescription, :visibility_id)
    end
end
