class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer  :broadcast_id
      t.integer  :length
      t.string   :type

      t.timestamps null: false
    end
  end
end
