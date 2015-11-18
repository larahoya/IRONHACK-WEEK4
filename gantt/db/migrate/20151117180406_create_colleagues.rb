class CreateColleagues < ActiveRecord::Migration
  def change
    create_table :colleagues do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
