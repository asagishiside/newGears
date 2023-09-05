class AddTextToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :text, :text
  end
end
