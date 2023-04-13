class CreateWeatherDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_dashboards do |t|
      t.string :country
      t.string :city
      t.integer :forecast_days, default: 1
      t.references :user

      t.timestamps
    end
  end
end
