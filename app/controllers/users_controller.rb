class UsersController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to cats_url
    else
      flash[:notice] << "User not created."
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def logged_in
    redirect_to cats_url if current_user
  end

end
