class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  #未ログインユーザが「TOP、ABOUTを除く」ビューにアクセスすると、自動的にログインビューへ飛ぶdeviseのヘルパーメソッド
  before_action :configure_permitted_parameters, if: :devise_controller?
  #こうすることでdevise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行されます。
 
 def after_sign_in_path_for(resource)
   flash[:notice] = "Signed in successfully"
   user_path(resource)
 end
 
  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully"
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end