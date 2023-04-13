class WeatherDashboard < ApplicationRecord
  belongs_to :user

  validates :country, :city, presence: true
end
