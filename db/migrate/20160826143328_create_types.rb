class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :banner
      t.string :name
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
