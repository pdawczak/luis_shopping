require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe "#valid?" do
    context "with valid attributes" do
      it "indicates that the model is valid" do
        item = Item.new(name: "Sample")
        expect(item).to be_valid
      end
    end

    context "with invalid attributes" do
      it "indicates that the model is invalid" do
        item = Item.new(name: "")
        expect(item).to be_invalid
        expect(item.errors.keys).to include(:name)
      end

      it "indicates that item of the same name already exists" do
        Item.create(name: "Sample")
        item = Item.new(name: "Sample")

        item.valid?
        expect(item.errors.keys).to include(:name)
      end
    end
  end
end
