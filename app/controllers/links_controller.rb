class LinksController < ApplicationController
  before_action :set_menu, only: [:destroy, :edit, :update]
  before_action :require_user, except: [:index]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
    @menus = Menu.all
  end

  def create
    @link = Link.new link_params

    if @link.save
      redirect_to links_path
      flash[:notice] = "Link saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @link.update link_params
      flash[:notice] = "Huh?? Something failed!"
      redirect_to links_path
    else
      render :edit
    end
  end

  def destroy
    @link.destroy

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:name, :url, menu_ids: [])
  end

  def set_menu
    @link = Link.find(params[:id])
  end
end
