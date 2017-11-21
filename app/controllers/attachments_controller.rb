class AttachmentsController < ApplicationController
  before_action :set_infohash1, only: [:new, :create]
  before_action :set_attachment, only: [:destroy]

  # GET /infohashes/:infohash_id/attachments/new
  def new
    @attachment = Attachment.new
    @attachment.infohash = @infohash1
    @infohashes = Infohash.where(:user => current_user)
  end


  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment.infohash, notice: 'Attachment was successfully created.' }
        format.json { render :show, status: :created, location: @attachment.infohash }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to infohashes_url, notice: 'Attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_infohash1
      @infohash1 = Infohash.find(params[:infohash_id])
    end
    
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, onl y allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:name, :infohash_id, :infohash2_id)
    end
end
