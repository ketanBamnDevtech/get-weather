class WeatherDashboardsController < ApplicationController
  def index
    @city = 'Indore'
    @country = 'India'
    @days = 3
    @city_weather = WeatherApi::GetWeatherData.new(city: @city).call
  end

  def new
  end

  def create
  end

  def delete
  end
end
