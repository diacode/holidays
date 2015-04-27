class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_action :set_gon_globals

  private

  def authenticate_admin!
    render head: :forbidden, text: 'Forbidden' unless current_user && current_user.admin?
  end

  private

  def set_gon_globals
    gon.authenticity_token = form_authenticity_token
    gon.locale = I18n.locale
    gon.vacation_request_statuses = VacationRequest.statuses
  end
end
