require 'rails_helper'

RSpec.describe Auction, type: :model do

  describe "attribute presence validation" do
    let(:some_auction) {create :auction}

    it 'should have a name' do
      expect(some_auction.name).to eq("Hot Rod Auctions")
      expect(some_auction).to be_valid
    end

    describe 'without a name' do
      let(:unnamed_auction) {build :unnamed_auction}
      it 'wont save to database' do
        expect(unnamed_auction.save).to be false
      end
    end
  end

  describe "model methods" do
    let(:auction_with_vehicles) {create :auction_with_vehicles}
    it 'returns an auction`s number of vehicles' do
      expect(auction_with_vehicles.vehicles_count).to be 2
    end

    it 'returns the total profit' do
      expect(auction_with_vehicles.total_profit).to eq 5000.00
    end

    it 'returns the average profit per vehicle' do
      expect(auction_with_vehicles.average_profit).to eq 2500.00
    end
  end
end

