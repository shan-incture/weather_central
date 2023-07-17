class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
