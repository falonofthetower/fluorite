class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @menu = Menu.all
  end

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
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "Your ill-advised change has been made"
      redirect_to menus_path
    else
      flash.now[:error] = "Whew that stupid thing you tried--it failed!"
      render 'edit'
    end
  end

  def destroy
    @menu.destroy

    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end

  def set_menu
    @menu = Menu.find_by_slug!(params[:id])
  end
end
