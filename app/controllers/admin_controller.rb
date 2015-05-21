class AdminController < ApplicationController
  before_action :check_admin_user

  private

  def check_admin_user
    redirect_to root_url and return unless current_user.admin
  end
end
