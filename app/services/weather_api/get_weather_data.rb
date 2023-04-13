module WeatherApi
  class GetWeatherData < Base
    FORCAST_WEATHER_URL = '/forecast.json'.freeze

    def call
      url = "#{BASE_URL}#{FORCAST_WEATHER_URL}?key=#{@api_key}&q=#{@city}"
      url += "&days=#{@days}" if (@days != MIN_FORCAST_DAYS) && (@days < MAX_FORCAST_DAYS)

      HTTParty.get(url)
    end
  end
end
