module WeatherApi
  class Base
    BASE_URL = 'http://api.weatherapi.com/v1'.freeze
    MIN_FORCAST_DAYS = 1
    MAX_FORCAST_DAYS = 15

    def initialize(city:, days: 1)
      @api_key = 'ca01c51f9e684144ae9115313231304'
      @city = city
      @days = days
    end
  end
end
