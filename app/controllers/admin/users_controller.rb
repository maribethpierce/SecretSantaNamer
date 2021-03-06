class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted!"
    redirect_to admin_users_path
  end

  private
  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:errors] = "You don't have the privileges to do that!"
      redirect_to dinosaurs_path
    end
  end
end
