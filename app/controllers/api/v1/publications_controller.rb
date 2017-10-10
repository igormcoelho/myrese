# app/controllers/api/v1/posts_controller.rb
module Api::V1
  class PublicationsController < ApiController
    before_action :set_publication, only: [:show]

    #respond_to :json
    
    def index
        respond_with Publication.all
    end

    def show
    logger.info "here we go!"
    #  respond_to do |format|
    #    format.json { render :show }
    #  end
    #render json: @publication
    #render :show, location: "/app/controllers/api/v1/publications/show.json.jbuilder"
    #render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    #respond_with @publication
    #render json: @publication
    
    #respond_to do |format|
    #  format.json
    #end
    output = @publication.as_json
    #render json: @publication.as_json(only: [:id, :title, :year, :code])
    render json: output #json.extract! json.myrese "v1.0", @publication #@publication.as_json(only: [:title, :year], include: [:authors, {infohash: {only:[:code]}}] )
    
    end

    private

    def set_publication
      @publication = Publication.find(params[:id])
    end
  end
end