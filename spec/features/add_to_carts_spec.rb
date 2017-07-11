require 'rails_helper'

RSpec.feature "When a user click the 'Add to Cart' button for a product on the home page, their cart increases by one", type: :feature, js: true do

   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    5.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart increases by one when 'Add to Cart' button is clickes" do

    # ACT
    visit root_path
    page.find('.products article:first-child footer').find_link('Add').click

    # DEBUG
    save_screenshot

    # VERIFY
    within('nav') { expect(page).to have_content('My Cart (1)') }

  end

end
