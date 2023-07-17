# frozen_string_literal: true

class OpenWeatherMapCall

  API_KEY = "62e817e7c30005323d257f62cc4b63ff".freeze


  def self.call(url)
    url += "&appid=#{API_KEY}"
    HTTParty.get(url)
  end
end