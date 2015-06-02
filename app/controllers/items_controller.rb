class ItemsController < ApplicationController
  def index
    @items = Item.all.to_a
    @new_item = Item.new
  end

  def create
    @items = Item.all
    @new_item = Item.new(new_item_params)

    if @new_item.save
      redirect_to items_path
    else
      render :index
    end
  end

  private

  def new_item_params
    params.require(:item).permit(:name)
  end
end
