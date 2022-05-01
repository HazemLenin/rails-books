class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    include Pagy::Backend

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name])
    end

    def user_not_authorized # pundit
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end
