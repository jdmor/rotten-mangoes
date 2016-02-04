class Admin::UsersController < ApplicationController

  before_filter :restrict_access
  before_filter :restrict_user_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "#{@user.full_name} was created."
    else
      render :new
    end
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
