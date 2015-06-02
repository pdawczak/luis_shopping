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

  describe "#create" do
    context "when valid attributes provided" do
      it "creates new Item" do
        expect {
          item_attributes = { name: "Sample Item" }
          post :create, item: item_attributes
        }.to change(Item, :count).by(1)
      end
    end

    context "when invalid attributes provided" do
      it "doesnt create any Item" do
        expect {
          item_attributes = { name: "" }
          post :create, item: item_attributes
        }.to change(Item, :count).by(0)
      end

      it "renders page indicating errors" do
        item_attributes = { name: "" }
        post :create, item: item_attributes

        expect(assigns(:new_item)).to be_invalid
        expect(assigns(:new_item).errors.keys).to include(:name)
      end
    end
  end
end
