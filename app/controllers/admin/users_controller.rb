class Admin::UsersController < ApplicationController

  before_filter :restrict_access

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}! Use your admin powers wisely!"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

  def restrict_access
    if !current_user
      flash[:alert] = 'You must log in.'
      redirect_to new_session_path
    elsif current_user && current_user.admin == false
      flash[:alert] = 'This page is only accessible to admins.'
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
