class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  private

  def authenticate_admin!
    render head: :forbidden, text: 'Forbidden' unless current_user && current_user.admin?
  end
end
