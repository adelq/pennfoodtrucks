class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.text :name
      t.text :cleanURL
      t.float :rating
      t.integer :phone
      t.string :MF_open
      t.string :MF_close
      t.string :Sa_open
      t.string :Sa_close
      t.string :Su_open
      t.string :Su_close
      t.string :genreBig
      t.string :genreSmall1
      t.string :genreSmall2
      t.text :location
      t.text :blurb
      t.decimal :long
      t.decimal :lat
      t.text :intersection

      t.timestamps null: false
    end
  end
end
