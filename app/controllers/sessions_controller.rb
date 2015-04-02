class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have arrived!"
      redirect_to user_path user.id
    else
      flash.now[:error] = "Invalid login!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have left the true path"
    redirect_to login_path
  end
end
