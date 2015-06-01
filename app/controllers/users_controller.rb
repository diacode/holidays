class UsersController < ApplicationController
  decorates_assigned :user

  def index; end

  def show
    @user = User.find params[:id]
  end
end
