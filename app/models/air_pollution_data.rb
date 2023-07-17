class AirPollutionData < ApplicationRecord
  belongs_to :location

  def self.average_aqi_per_location
    group(:location_id)
      .average(:aqi)
  end

  def self.average_aqi_per_state
    joins(:location)
      .group(:state)
      .average(:aqi)
  end


end