class Cooperative < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :address, presence: true
end
