class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :timestamp
      t.string :ip
      t.boolean :public
      t.references :food_truck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
