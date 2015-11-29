class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index:true
      t.string :title
      t.string :description
      t.datetime :deadline
      t.integer :minimum_bid

      t.timestamps null: false
    end
  end
end
