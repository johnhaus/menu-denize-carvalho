class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to @item, notice: "Item successfully created."
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item successfully deleted."
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
