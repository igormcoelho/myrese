class InfohashMembersController < ApplicationController
  before_action :set_infohash_member, only: [:show, :edit, :update, :destroy]

  # GET /infohash_members
  # GET /infohash_members.json
  def index
    @infohash_members = InfohashMember.all
  end

  # GET /infohash_members/1
  # GET /infohash_members/1.json
  def show
  end

  # GET /infohash_members/new
  def new
    @infohash_member = InfohashMember.new
  end

  # GET /infohash_members/1/edit
  def edit
  end

  # POST /infohash_members
  # POST /infohash_members.json
  def create
    @infohash_member = InfohashMember.new(infohash_member_params)

    respond_to do |format|
      if @infohash_member.save
        format.html { redirect_to @infohash_member, notice: 'Infohash member was successfully created.' }
        format.json { render :show, status: :created, location: @infohash_member }
      else
        format.html { render :new }
        format.json { render json: @infohash_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infohash_members/1
  # PATCH/PUT /infohash_members/1.json
  def update
    respond_to do |format|
      if @infohash_member.update(infohash_member_params)
        format.html { redirect_to @infohash_member, notice: 'Infohash member was successfully updated.' }
        format.json { render :show, status: :ok, location: @infohash_member }
      else
        format.html { render :edit }
        format.json { render json: @infohash_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infohash_members/1
  # DELETE /infohash_members/1.json
  def destroy
    @infohash_member.destroy
    respond_to do |format|
      format.html { redirect_to infohash_members_url, notice: 'Infohash member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infohash_member
      @infohash_member = InfohashMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def infohash_member_params
      params.require(:infohash_member).permit(:infohash_id, :member, :identification_id)
    end
end
