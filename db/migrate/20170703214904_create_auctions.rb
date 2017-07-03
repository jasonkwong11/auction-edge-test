class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.decimal :winning_bid, :precision => 8, :scale => 2
      t.decimal :seller_payout, :precision => 8, :scale => 2
      
      t.timestamps
    end
  end
end
