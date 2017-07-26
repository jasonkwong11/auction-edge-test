class Vehicle < ApplicationRecord

  belongs_to :auction

  validates_numericality_of [:winning_bid, :seller_payout]
  validates_presence_of :year, :make, :model, :stock_number, :description, :winning_bid, :seller_payout
  validates :year, length: { is: 4 }
  validate :seller_payout_is_less_than_winning_bid

  def year_make_model
    "#{self.year.to_s} #{self.make} #{self.model}"
  end

private

  def seller_payout_is_less_than_winning_bid
    if self.seller_payout > winning_bid
      errors.add(:seller_payout, "should be less than the winning bid")
    end
  end
end
