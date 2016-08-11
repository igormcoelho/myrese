# app/controllers/api/v1/posts_controller.rb
module Api::V1
  class PublicationsController < ApiController
    before_action :set_publication, only: [:show]

    respond_to :json
    
    def index
        respond_with Publication.all
    end

    def show
    #    respond_to do |format|
    #        format.json { render :show, location: 'app/controllers/api/v1/publications' }
    #    end
    #render json: @publication
    #render :show, location: "/app/controllers/api/v1/publications/show.json.jbuilder"
    #render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    #respond_with @publication
    end

    private

    def set_publication
      @publication = Publication.find(params[:id])
    end
  end
end