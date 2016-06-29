class SupervisionsController < ApplicationController
  before_action :set_supervision, only: [:show, :edit, :update, :destroy]

  # GET /supervisions
  # GET /supervisions.json
  def index
    @supervisions = Supervision.all
  end

  # GET /supervisions/1
  # GET /supervisions/1.json
  def show
  end

  # GET /supervisions/new
  def new
    @supervision = Supervision.new
  end

  # GET /supervisions/1/edit
  def edit
  end

  # POST /supervisions
  # POST /supervisions.json
  def create
    @supervision = Supervision.new(supervision_params)

    respond_to do |format|
      if @supervision.save
        format.html { redirect_to @supervision, notice: 'Supervision was successfully created.' }
        format.json { render :show, status: :created, location: @supervision }
      else
        format.html { render :new }
        format.json { render json: @supervision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supervisions/1
  # PATCH/PUT /supervisions/1.json
  def update
    respond_to do |format|
      if @supervision.update(supervision_params)
        format.html { redirect_to @supervision, notice: 'Supervision was successfully updated.' }
        format.json { render :show, status: :ok, location: @supervision }
      else
        format.html { render :edit }
        format.json { render json: @supervision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisions/1
  # DELETE /supervisions/1.json
  def destroy
    @supervision.destroy
    respond_to do |format|
      format.html { redirect_to supervisions_url, notice: 'Supervision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supervision
      @supervision = Supervision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supervision_params
      params.require(:supervision).permit(:user_id, :title, :suptype, :mainsup, :profile_id, :date_begin, :date_end)
    end
end
