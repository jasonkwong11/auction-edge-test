require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  describe "attribute presence validation" do
    let(:vehicle) {create :vehicle}

    it 'should have a make' do
      expect(vehicle.make).to eq("Tesla")
      expect(vehicle).to be_valid
    end

    describe 'without a make' do
      let(:no_make_vehicle) {build :no_make_vehicle}
      it 'wont save to database' do
        expect(no_make_vehicle.save).to be false
      end
    end

    describe 'year' do
      it 'should be invalid if not 4 characters' do
        vehicle.year = '100'
        expect(vehicle).to be_invalid
        vehicle.year = "10000"
        expect(vehicle).to be_invalid
      end

      it "should be an integer" do
        vehicle.year = "oops"
        expect(vehicle).to be_invalid
      end
    end

    describe "winning_bid" do
      it "should be an integer" do
        vehicle.winning_bid = "oops"
        expect(vehicle).to be_invalid
      end
    end

    describe "seller_payout" do
      it "should be an integer" do
        vehicle.seller_payout = "oops"
        expect(vehicle).to be_invalid
      end

      it "should be less than winning_bid" do
        vehicle.seller_payout = 2
        vehicle.winning_bid = 1

        expect(vehicle).to be_invalid
      end
    end
  end

  describe "belongs_to association" do
    let(:another_vehicle) {create :another_vehicle}

    it 'should belong to an auction' do
      expect(another_vehicle.auction.name).to eq "Hot Rod Auctions"
    end
  end

  describe "model methods" do
    let(:vehicle) {create :vehicle}

    it '#year_make_model should return the correct string' do
      expect(vehicle.year_make_model).to eq "2017 Tesla X"
    end
  end
end
