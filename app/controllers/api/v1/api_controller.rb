# app/controllers/api/v1/api_controller.rb
module Api::V1
  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :request_not_found

    before_filter :authenticate_user_from_token!
    before_filter :authenticate_user!

    def invalid_request
      @response = Hash.new

      @response[:message] = "Invalid request"
      @response[:code] = 400
      @response[:help] = "Invalid request. Please check the docs. ERR: 001"

      return render json: @response, status: 400
    end

    def request_not_found
      @response = Hash.new

      @response[:message] = "Invalid request"
      @response[:code] = 404
      @response[:help] = "Invalid request. Please check the docs. ERR: 002"

      return render json: @response, status: 404
    end

    private

    def authenticate_user_from_token!
      #user_email = params[:user_email].presence
      #user = user_email && User.find_by_email(user_email)
      #puts user_email
      username = params[:username].presence
      user = username && User.find_by_username(username)
      puts username
      puts user.email

      if user && Devise.secure_compare(user.auth_token, params[:user_token])
        sign_in user, store: false
      end
    end
  end
end
# thanks to: https://medium.com/@hugooodias/create-a-simple-subdomain-api-layer-for-your-already-built-rails-app-d2145f99c3a4#.a9util9s2
