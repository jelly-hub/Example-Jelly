class CreateFoods < ActiveRecord::Migration
  def change
     create_table :foods do |t|
      t.string :name
      t.string :type
      t.text :description
      t.references :user
      
      t.timestamps null: false
    end
  end
end
