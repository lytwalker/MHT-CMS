class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :thumb
      t.string :preview
      t.string :name
      t.text :description
      t.decimal :price
      t.string :sku
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
