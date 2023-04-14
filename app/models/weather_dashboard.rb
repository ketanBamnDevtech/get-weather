class WeatherDashboard < ApplicationRecord
  belongs_to :user

  validates :country, :city, :state, presence: true
  validates :forecast_days, inclusion: { in: 1..8 }
  validate :verify_similar_weather_cards_should_not_exist?

  scope :city_names_and_days, ->(user_id){ where(user_id: user_id).pluck(:city, :forecast_days) }

  private

  def verify_similar_weather_cards_should_not_exist?
    if self.class.where(user_id: user_id, country: country, city: city).exists?
      errors.add(:base, "Weather card with city: #{city}, already added.")
    end

    true
  end
end
