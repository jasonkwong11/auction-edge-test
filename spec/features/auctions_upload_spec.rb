require "rails_helper"

RSpec.feature "Uploading auctions from CSV", :type => :feature do
  scenario "User visits the homepage" do
    visit "/"

    expect(page).to have_text("Import Auctions with CSV")
  end

  scenario "User uploads a CSV" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"

    expect(page).to have_text("Auctions imported.")
  end

  scenario "Clicking on an auction title takes you to that auctions show page" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Alpha Auctions")

    expect(page).to have_text("Here are the vehicles for Alpha Auctions")
  end

  scenario "An auction's show page displays its vehicles" do
    visit "/"
    attach_file('file', File.absolute_path('./example_input.csv'))
    click_button "Import CSV"
    click_link("Alpha Auctions")

    expect(page).to have_text("1978 Chevrolet Nova")
    expect(page).to have_text("1979 Honda Civic")
  end
end
