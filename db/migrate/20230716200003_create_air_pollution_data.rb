class CreateAirPollutionData < ActiveRecord::Migration[6.1]
  def change
    create_table :air_pollution_data do |t|
      t.integer :location_id
      t.integer :aqi
      t.float :co
      t.float :no
      t.float :no2
      t.float :o3
      t.float :so2
      t.float :pm2_5
      t.float :pm10
      t.float :nh3
      t.timestamp :date_utc

      t.timestamps
    end
  end
end
