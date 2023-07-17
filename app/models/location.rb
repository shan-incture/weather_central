class Location < ApplicationRecord
  self.table_name = 'locations'
  has_many :air_pollution_data

  validates :latitude, :longitude, presence: true
  validates :city, :state, :country, presence: true

  def full_name
    "#{city}, #{state}, #{country}"
  end
end