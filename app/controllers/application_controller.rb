class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username = 'kazuhira' && password = '1228'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password_confirmation, :sex_id, :prefecture_id, :city, :holiday_id, :member_since, :favorite_part, :favorite_singer, :more_join_id, :group])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :password_confirmation, :sex_id, :prefecture_id, :city, :holiday_id, :member_since, :favorite_part, :favorite_singer, :more_join_id, :group])
  end

end