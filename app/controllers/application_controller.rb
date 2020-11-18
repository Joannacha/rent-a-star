class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: [:index, :my_bookings, :my_listings], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:my_bookings, :my_listings], unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^my_bookings$)|(^my_listings$)/
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email,
                         :password,
                         :password_confirmation,
                         :first_name,
                         :last_name,
                         :username)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email,
                         :first_name,
                         :last_name,
                         :username,
                         :phone,
                         :password,
                         :password_confirmation,
                         :current_password)
    end
  end
end
