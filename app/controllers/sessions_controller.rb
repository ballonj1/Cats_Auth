class SessionsController < ApplicationController
  before_action :logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentidals(params[:user][:username], params[:user][:password])
    if user
      login!(user)
      redirect_to cats_url
    else
      flash[:errors] << "This user does not exist"
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to cats_url
    end
  end

  private
  def logged_in
    redirect_to cats_url if current_user
  end
end
