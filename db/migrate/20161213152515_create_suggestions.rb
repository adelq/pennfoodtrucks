class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.text :title
      t.text :body
      t.integer :status

      t.timestamps null: false
    end
  end
end
