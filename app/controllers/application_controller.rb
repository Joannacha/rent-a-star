class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
protected
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email,
                       :password,
                       :password_confirmation,
                       :first_name,
                       :last_name,
                       :username,
                       :photo
                       )
  end
  devise_parameter_sanitizer.permit(:account_update) do |user_params|
    user_params.permit(:email,
                       :first_name,
                       :last_name,
                       :username,
                       :phone,
                       :password,
                       :password_confirmation,
                       :current_password,
                       :photo
                        )
  end
end
end
