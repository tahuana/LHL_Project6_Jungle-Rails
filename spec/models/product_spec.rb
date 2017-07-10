require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @category = Category.create(name: 'Apparel')
      @product = @category.products.create({
        name:  'Hipster Hat',
        description: "Test",
        quantity: 10,
        price: 64.99
      })

    end

    context "Name:" do

      it "Product should have name" do
        expect(@product.name.present?).to eq(true)
      end

      it "Product without a name should log error" do
        @category = Category.create(name: 'Apparel')
        @product = @category.products.create({
          name:  nil,
          description: "Test",
          quantity: 10,
          price: 64.99
        })
        expect(@product.errors.full_messages.present?).to eq(true)
      end

    end

  end
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true