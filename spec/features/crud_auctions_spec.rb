require "rails_helper"

RSpec.feature "CRUD vehicles from auction show page", :type => :feature do

 scenario "user can visit /auctions/new" do
  visit '/'
  click_link "New Auction"

  expect(page).to have_content("Create a new auction!")
 end

 scenario "user can create new auction and at least one vehicle" do
  visit '/'
  click_link "New Auction"

  fill_in("Name", with: "Hot Rod Auctions")
  fill_in("Street address", with: "123 Fake Street")
  fill_in("City", with: "Seattle")
  fill_in("State", with: "WA")
  fill_in("Zip", with: 98101)

  fill_in("Year", with: "2001")
  fill_in("Make", with: "Ford")
  fill_in("Model", with: "Mustang")
  fill_in("Stock number", with: "1111")
  fill_in("Description", with: "A classic car")
  fill_in("Winning bid", with: 15000)
  fill_in("Seller payout", with: 13000)

  click_button("Submit")
  expect(page).to have_content("Hot Rod Auctions")
  expect(page).to have_content("2001 Ford Mustang")
 end
end