class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this Wiki. Upgrade your account to premium to view!"
    redirect_to '/wikis'
  end
end
