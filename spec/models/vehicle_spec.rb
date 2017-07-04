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
  end

  describe "belongs_to association" do
    let(:another_vehicle) {create :another_vehicle}

    it 'should belong to an auction' do
      expect(another_vehicle.auction.name).to eq "Hot Rod Auctions"
    end
  end
end
