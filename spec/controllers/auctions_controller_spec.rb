require "rails_helper"

RSpec.describe AuctionsController, :type => :controller do
  describe "GET index " do
    it "responds successfully" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @auctions" do
      auction = FactoryGirl.create(:auction)
      auction2 = FactoryGirl.create(:auction)
      get :index
      expect(assigns(:auctions)).to eq([auction, auction2])
    end
  end
end