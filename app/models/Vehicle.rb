class Vehicle < ApplicationRecord
  belongs_to :auction

  validates_presence_of :year, :make, :model, :stock_number, :description, :winning_bid, :seller_payout
end