class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :item_id
      t.string :description
      t.string :data

      t.timestamps null: false
    end
  end
end
