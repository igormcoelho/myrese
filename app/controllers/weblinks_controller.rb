class WeblinksController < ApplicationController
  before_action :set_weblink, only: [:show, :edit, :update, :destroy]

  # GET /weblinks
  # GET /weblinks.json
  def index
    #@weblinks = Weblink.all
    @weblinks  = Weblink.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @weblinks += Weblink.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @weblinks.uniq!
  end

  # GET /weblinks/1
  # GET /weblinks/1.json
  def show
  end

  # GET /weblinks/new
  def new
    @weblink          = Weblink.new
    @infohash         = Infohash.new
    @weblink.infohash = @infohash
  end

  # GET /weblinks/1/edit
  def edit
   @infohash = @weblink.infohash
  end

  # POST /weblinks
  # POST /weblinks.json
  def create
    @infohash = Infohash.new(infohash_params)
    @weblink  = @infohash.build_weblink(weblink_params)

    @infohash.user     = current_user
    @infohash.htype_id = Weblink::HTYPE
    @infohash.code     = "link" + Project.count.to_s

    respond_to do |format|
      if @weblink.save
        format.html { redirect_to @weblink, notice: 'Weblink was successfully created.' }
        format.json { render :show, status: :created, location: @weblink }
      else
        format.html { render :new }
        format.json { render json: @weblink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weblinks/1
  # PATCH/PUT /weblinks/1.json
  def update
    respond_to do |format|
      @weblink.infohash.assign_attributes(infohash_params)
      if @weblink.update(weblink_params)
        format.html { redirect_to @weblink, notice: 'Weblink was successfully updated.' }
        format.json { render :show, status: :ok, location: @weblink }
      else
        format.html { render :edit }
        format.json { render json: @weblink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weblinks/1
  # DELETE /weblinks/1.json
  def destroy
    @weblink.infohash.destroy
    respond_to do |format|
      format.html { redirect_to weblinks_url, notice: 'Weblink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weblink
      @weblink = Weblink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weblink_params
      params.require(:weblink).permit(:link)
    end
    
    def infohash_params
      params.require(:weblink).permit(:gtitle, :gdescription, :visibility_id)
    end
end
