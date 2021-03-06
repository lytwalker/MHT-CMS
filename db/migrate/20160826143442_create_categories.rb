class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :thumb
      t.string :name
      t.text :description
      t.string :url
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
