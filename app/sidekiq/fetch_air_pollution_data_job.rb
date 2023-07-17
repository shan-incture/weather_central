class FetchAirPollutionDataJob
  include Sidekiq::Job

  API_URL = "https://api.openweathermap.org/"

  def perform
    # Get all locations from the database
    locations = Location.all

    # For each location, fetch the current air pollution data from OpenWeatherMap
    locations.each do |location|
      # Get the latitude and longitude of the location
      latitude = location.latitude
      longitude = location.longitude

      begin
        # Create a new HTTP call instance
        call = OpenWeatherMapCall

        #conctinate Base URL with params
        url = API_URL + "data/2.5/air_pollution?lat=#{latitude}&lon=#{longitude}"

        # Make the HTTP call
        response = call.call(url)

        # Create an AirPollutionDataImporter instance
        importer = AirPollutionDataImporter.new(response, location)

        # Import the air pollution data

        importer.import
        puts "------------------------------"
        puts "Imported sucessfully #{location.full_name}"
        puts "------------------------------"
      rescue AirPollutionDataImportError => e
        Rails.logger.error(e.message)
      rescue StandardError => e
        Rails.logger.error(e.message)
      end
    end
  end

end

