require "rails_helper"

RSpec.feature "CRUD vehicles from auction show page", :type => :feature do
  scenario "clicking on new vehicle button takes user to new vehicle form" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Alpha Auctions")

    click_link("New Vehicle")
    expect(page).to have_content("Fill in the Vehicle Form")
  end

  scenario "after correctly filling in a new vehicle form, the vehicle info is shown on the auction show page" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Alpha Auctions")

    click_link("New Vehicle")
    fill_in('Year', with: "1999")
    fill_in('Make', with: "Ford")
    fill_in('Model', with: "F-150")
    fill_in('Stock number', with: "232323")
    fill_in('Description', with: "A reliable old truck")
    fill_in('Winning bid', with: 11000)
    fill_in('Seller payout', with: 10000)

    click_button('Submit')

    expect(page).to have_content("Vehicle created!")
    expect(page).to have_content("1999 Ford F-150")
  end

  scenario "User visits the vehicle show page" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Jerry's Auction")
    click_link("2013 Chevy Avalanche")

    expect(page).to have_content("More details about 2013 Chevy Avalanche")
    expect(page).to have_content("Stock Number: 23457")
    expect(page).to have_content("Description: Not Gerry, Jerry")
    expect(page).to have_content("Winning Bid: $15,000.00")
    expect(page).to have_content("Seller Payout: $13,000.0")
  end

  scenario "User edits a vehicle" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Jerry's Auction")
    click_link("2013 Chevy Avalanche")

    click_link "Edit Vehicle"

    find(:id, 'vehicle_year').set "2014"

    click_button("Submit")

    expect(page).to have_content("More details about 2014 Chevy Avalanche")
  end

  scenario "User deletes a vehicle" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Alpha Auctions")
    click_link("1979 Honda Civic")

    click_link "Delete Vehicle"

    expect(page).to have_no_content("1979 Honda Civic")
  end
end
