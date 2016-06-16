class GroupmembersController < ApplicationController
  before_action :set_groupmember, only: [:show, :edit, :update, :destroy]

  # GET /groupmembers
  # GET /groupmembers.json
  def index
    @groupmembers = Groupmember.all
  end

  # GET /groupmembers/1
  # GET /groupmembers/1.json
  def show
  end

  # GET /groupmembers/new
  def new
    @groupmember = Groupmember.new
  end

  # GET /groupmembers/1/edit
  def edit
  end

  # POST /groupmembers
  # POST /groupmembers.json
  def create
    @groupmember = Groupmember.new(groupmember_params)

    respond_to do |format|
      if @groupmember.save
        format.html { redirect_to @groupmember, notice: 'Groupmember was successfully created.' }
        format.json { render :show, status: :created, location: @groupmember }
      else
        format.html { render :new }
        format.json { render json: @groupmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupmembers/1
  # PATCH/PUT /groupmembers/1.json
  def update
    respond_to do |format|
      if @groupmember.update(groupmember_params)
        format.html { redirect_to @groupmember, notice: 'Groupmember was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupmember }
      else
        format.html { render :edit }
        format.json { render json: @groupmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupmembers/1
  # DELETE /groupmembers/1.json
  def destroy
    @groupmember.destroy
    respond_to do |format|
      format.html { redirect_to groupmembers_url, notice: 'Groupmember was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupmember
      @groupmember = Groupmember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupmember_params
      params.require(:groupmember).permit(:user_id, :group_id)
    end
end
