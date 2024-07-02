class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    redirect_to admin_root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :address_line_1, :address_line_2, :zip, :city, :state, :gender, :date_of_birth, :email, :password, :password_confirmation, :physician_id, :agreed_to_terms_of_use)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :address_line_1, :address_line_2, :zip, :city, :state, :gender, :date_of_birth,  :email, :password, :current_password, :password_confirmation, :agreed_to_terms_of_use)}
  end

end
