class Vehicle < ApplicationRecord

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  belongs_to :auction

  validates_numericality_of [:winning_bid, :seller_payout]
  validates_presence_of :year, :make, :model, :stock_number, :description, :winning_bid, :seller_payout
  validates :year, length: { is: 4 }

  def year_make_model
    "#{self.year.to_s} #{self.make} #{self.model}"
  end
end
