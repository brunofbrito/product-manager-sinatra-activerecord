class CreateProducts < ActiveRecord::Migration
    create_table :products do |table|
      table.string :name
      table.text :description
      table.integer :price
      table.string :category
  end
end
