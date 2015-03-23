require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
  describe "#index" do
    before do
      @items = []
      @items << Item.create(name: "Computer")
      @items << Item.create(name: "Tea")
    end

    it "has the action" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "has a list of all items" do
      get :index
      expect(assigns(:items)).to eq(@items)
    end
  end
end
