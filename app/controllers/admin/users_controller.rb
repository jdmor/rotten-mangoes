class Admin::UsersController < ApplicationController

  before_filter :restrict_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
    redirect_to new_user_path
  end

end
