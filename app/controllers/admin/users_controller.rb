class Admin::UsersController < ApplicationController

  before_filter :restrict_access
  before_filter :restrict_user_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
    redirect_to new_user_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    user = @user.full_name
    @user.destroy
    redirect_to admin_users_path, notice: "#{user} was deleted."
  end

  protected

  def restrict_user_access
    unless current_user.admin == true
      flash[:alert] = 'Access restrited to admins.'
      redirect_to root_path
    end
  end

end
