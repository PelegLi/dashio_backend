class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string   :categories_lineup_order
      t.datetime :air_time

      t.timestamps null: false
    end
  end
end
