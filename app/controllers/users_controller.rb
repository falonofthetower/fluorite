class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Fluorite"
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile now reflects your reality"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end

    def set_user
      @user = User.find(params[:id])
    end
end
