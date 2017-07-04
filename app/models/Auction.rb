require 'roo'

class Auction < ApplicationRecord
  has_many :vehicles

  def self.import(file)
    csv = Roo::CSV.new(file.path)
    (2..csv.last_row).map do |i|
      if csv.row(i)[0]
        auction_attributes = {
          name: csv.row(i)[0],
          street_address: csv.row(i)[1],
          city: csv.row(i)[2],
          state: csv.row(i)[3],
          zip: csv.row(i)[4]
        }
        vehicle_attributes = {
          year: csv.row(i)[5],
          make: csv.row(i)[6],
          model: csv.row(i)[7],
          stock_number: csv.row(i)[8],
          winning_bid: csv.row(i)[9],
          seller_payout: csv.row(i)[10],
          description: csv.row(i)[11]
        }

        auction = Auction.find_or_initialize_by(auction_attributes)
        auction.vehicles.find_or_initialize_by(vehicle_attributes)
        auction.save
      end
    end
  end
end