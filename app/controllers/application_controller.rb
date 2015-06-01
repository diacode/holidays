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
    return unless current_user.present?

    gon.authenticity_token = form_authenticity_token
    gon.locale = I18n.locale
    gon.requested_day_statuses = RequestedDay.statuses
    gon.current_user = UserSerializer.new(current_user).attributes
  end
end
