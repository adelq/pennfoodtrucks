class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :type
      t.text :name
      t.decimal :price
      t.text :comments
      t.references :food_truck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
