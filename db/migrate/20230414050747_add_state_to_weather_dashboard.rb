class AddStateToWeatherDashboard < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_dashboards, :state, :string
  end
end
