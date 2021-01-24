class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end
  
  def after_sign_in_path_for(resource)
    # sign_in後のパス指定（デフォルトでroot_path）
    user_path(resource)
    # user#showにsign-inで受け取ったresource(user)の情報を渡している
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
