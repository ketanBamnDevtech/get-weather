class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to weather_dashboards_path and return if user_signed_in?
  end
end
