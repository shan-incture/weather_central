# frozen_string_literal: true
class AirPollutionDataImporter

  attr_reader :response, :status, :location
  def initialize(response, location)
    @status =  response.code
    @response = response
    @location = location
  end

  def import
    # Check if the API response is invalid
    if status != 200
      Rails.logger.error("API response is invalid: #{@response}")
      raise AirPollutionDataImportError
    end
    response = JSON.parse(@response.body)

    data = response['list'][0]

    # Check if the air pollution data is invalid
    if data['main']['aqi'].nil?
      Rails.logger.error("Air pollution data is invalid: #{data}")
      raise AirPollutionDataImportError
    end

    # Save the air pollution data in the database
    air_pollution_data = AirPollutionData.new(
      location_id: @location.id,
      aqi: data['main']['aqi'],
      co: data['components']['co'],
      no: data['components']['no'],
      no2: data['components']['no2'],
      o3: data['components']['o3'],
      so2: data['components']['so2'],
      pm2_5: data['components']['pm2_5'],
      pm10: data['components']['pm10'],
      nh3: data['components']['nh3'],
      date_utc:  Time.at(data['dt']).utc
    )

    air_pollution_data.save!
  end
end