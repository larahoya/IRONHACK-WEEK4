class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :product
      t.references :user
      t.integer :amount

      t.timestamps null: false
    end
  end
end
