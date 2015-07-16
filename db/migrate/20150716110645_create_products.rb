class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |table|
      table.belongs_to :brand, index: true
      table.string :name
      table.text :description
      table.integer :price
    end
  end
end
