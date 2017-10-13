# app/controllers/api/v1/posts_controller.rb
module Api::V1
  class GfilesController < ApiController
    before_action :set_gfile, only: [:show]

    require 'active_support/all'
    #respond_to :json
    
    def index
        respond_with Gfile.all
    end

    def show

    #end
    output = @gfile.infohash.as_json.merge(@gfile.as_json)
    output["url"] = @gfile.filename.url
    output["myrese"] = "v1.0"
    #render json: @publication.as_json(only: [:id, :title, :year, :code])
    render json: output #json.extract! json.myrese "v1.0", @publication #@publication.as_json(only: [:title, :year], include: [:authors, {infohash: {only:[:code]}}] )
    
    end

    private

    def set_gfile
      @gfile = Gfile.find(params[:id])
    end
  end
end