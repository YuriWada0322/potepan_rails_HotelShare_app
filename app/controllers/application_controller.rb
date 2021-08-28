class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可
  before_action :authenticate_user!

  before_action :set_q

  # deviseコントローラーにストロングパラメータを追加         
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def set_q
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
  
end
