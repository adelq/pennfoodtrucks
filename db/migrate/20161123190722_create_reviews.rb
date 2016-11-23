class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :food_truck, index: true, foreign_key: true
      t.text :title
      t.text :owner
      t.text :email
      t.datetime :date
      t.text :comment
      t.decimal :overall
      t.integer :quality
      t.integer :speed
      t.integer :quantity
      t.integer :bang
      t.integer :friendliness
      t.boolean :display_rev
      t.string :owner_ip
      t.boolean :staff

      t.timestamps null: false
    end
  end
end
