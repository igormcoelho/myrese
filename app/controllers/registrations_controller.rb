#https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  skip_before_filter :verify_authenticity_token, :only => :create

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides Recaptcha
        respond_with_navigational(resource) { render :new }
      end 
    end
end
