class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :stock_number
      t.string :description
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
