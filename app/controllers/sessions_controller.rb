class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    Current.session = find_session_by_cookie
    terminate_session
    redirect_to new_session_path
  end

  def after_authentication_url
    products_path
  end

  def terminate_session
    Rails.logger.info "Attempting to terminate session with cookie: #{cookies[:session_id]}"
    if Current.session
      Rails.logger.info "Terminating session: #{Current.session.id}"
      Current.session.destroy
      cookies.delete(:session_id)
    else
      Rails.logger.info "No active session to terminate"
    end
  end
end
