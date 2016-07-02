class GroupUsersController < ApplicationController
  before_action :set_group, only: [:new, :create, :destroy]

  # GET /group_user/new
  def new
    @group_user = GroupUser.new(:group => @group)
  end

  # POST /group_users
  # POST /group_users.json
  def create
    @group_user = @group.group_users.build(group_user_params)
    respond_to do |format|
      if @group_user.save
        format.html { redirect_to groups_url, notice: 'User was successfully added to group.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /group_users/1
  # DELETE /group_users/1.json
  def destroy
    @group_user = @group.group_users.find(params[:id])
    @group_user.destroy
    
    respond_to do |format|
      format.html { redirect_to @group, notice: 'Group user was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_user_params
      params.require(:group_user).permit(:user_id)  #group_id is not needed (set_group)
    end
end
