class UsersController < ApplicationController

  def new
    if current_user && current_user.admin == false
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      set_user
      new_user_notice
    else
      render :new
    end
  end

  def set_user
    session[:user_id] = @user.id if !current_user
  end

  def new_user_notice
    if current_user && current_user.admin == true
      redirect_to new_user_path, notice: "You've created an account for #{@user.firstname}."
    else
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    end
  end

end
