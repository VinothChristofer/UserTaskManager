class ApplicationController < ActionController::Base
    include ActionController::MimeResponds
    
    protect_from_forgery except: :sign_in
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :email, :password])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    end
end
