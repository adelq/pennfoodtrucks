class ChangePhoneToString < ActiveRecord::Migration
  def up
    change_column :food_trucks, :phone, :string
  end
end
