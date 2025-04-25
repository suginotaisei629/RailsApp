class ApplicationController < ActionController::Base
  include Authentication
  allow_browser versions: :modern

  # アプリケーション全体で使うメソッド
  def current_user
    @current_user ||= find_user_by_session
  end

  def find_user_by_session
    session = find_session_by_cookie 
    session&.user  
  end

  def require_authentication
    unless current_user
      redirect_to new_session_path, alert: "ログインが必要です"
    end
  end

  def authenticated?
    current_user.present?
  end
end
