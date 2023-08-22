class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears do |t|
      t.string :name, null: false
      t.integer :gear_type, null: false
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
