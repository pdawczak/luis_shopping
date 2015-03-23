class ItemsController < ApplicationController
  def index
    @items = Item.all.to_a
  end
end
