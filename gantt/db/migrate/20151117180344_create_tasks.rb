class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index:true
      t.references :colleague, index:true
      t.string :name
      t.integer :hours

      t.timestamps null: false
    end
  end
end
