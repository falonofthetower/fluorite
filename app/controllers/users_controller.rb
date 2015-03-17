class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :role))

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
    if @user.update(params.require(:user).permit(:username, :role))
      flash[:notice] = "Your profile now reflects your reality"
      redirect_to root_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
