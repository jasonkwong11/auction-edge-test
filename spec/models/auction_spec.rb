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
end

