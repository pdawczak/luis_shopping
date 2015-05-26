class ItemsController < ApplicationController
  def index
    @items = Item.all.to_a
    @new_item = Item.new
  end

  def create
    @item = Item.create(new_item_params)
    redirect_to items_path
  end

  private

  def new_item_params
    params.require(:item).permit(:name)
  end
end
