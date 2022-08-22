class ApplicationController < ActionController::Base
  # ログイン認証が済んでいない状態でトップページ以外にアクセスしてもログイン画面に戻る
  before_action :authenticate_user!, except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

  end
end
