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
      session[:user_id] = @user.id # auto log in
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!!"
    else
      render :new
    end
  end

end
