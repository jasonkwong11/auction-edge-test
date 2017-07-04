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
end