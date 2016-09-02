class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :length
      t.decimal :cost
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
