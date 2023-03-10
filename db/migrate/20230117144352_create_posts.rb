class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :gear, null: false, foreign_key: true
      t.string :review, default: nil
      t.integer :score, null: false

      t.timestamps
    end
  end
end
