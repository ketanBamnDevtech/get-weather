class WeatherDashboardsController < ApplicationController
  def index
    city_names_days = WeatherDashboard.city_names_and_days(current_user.id)

    @all_cities_weather = {}
    city_names_days.each  do |sub_array|
      @all_cities_weather[sub_array[0]] = WeatherApi::GetWeatherData.new(city: sub_array[0], days: sub_array[1]).call
    end
  end

  def new
    @weather_dashboard = WeatherDashboard.new
    @countries = CS.countries.sort_by { |_key, value| value }.map { |k, v| [v, k.to_s] }
  end

  def create
    @weather_dashboard = WeatherDashboard.new(weather_dashboard_params)
    @weather_dashboard.user = current_user
    if @weather_dashboard.save
      redirect_to weather_dashboards_path
    else
      @countries = CS.countries.sort_by { |_key, value| value }.map { |k, v| [v, k.to_s] }
      render :new
    end
  end

  def destroy
    @weather_dashboard = WeatherDashboard.where(user_id: current_user.id, city: params[:city]).first
    @weather_dashboard.destroy
    redirect_to weather_dashboards_path
  end

  def update_state_options
    states = CS.states(params[:country_code]).sort_by { |_key, value| value }.map { |k, v| [v, k.to_s] }
    states.unshift(['Select state', ''])
    cities = [['Select city', '']]

    render json: { states: states, cities: cities }, status: :ok
  end

  def update_city_options
    cities = CS.cities(params[:state_code], params[:country_code]).map { |i| [i, i] }
    cities.unshift(['Select city', ''])

    render json: { cities: cities }, status: :ok
  end

  private

  def weather_dashboard_params
    params.require(:weather_dashboard).permit(:country, :state, :city, :forecast_days)
  end
end
