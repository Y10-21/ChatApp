class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # もしデバイスにかんするコントローラーの処理なら呼び出す
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    # nemeのキーを保存されることに許可をさせるためのデバイスを使ったときの特別なメソッド
  end
end
