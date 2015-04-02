class MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new menu_params

    if @menu.save
      redirect_to root_path
      flash[:notice] = "Menu spawned"
    else
      render :new
    end
  end

  def show
    @menu = Menu.find_by name: params[:name]
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end
end
