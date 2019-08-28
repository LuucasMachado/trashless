class GarbageMan < ApplicationRecord
  belongs_to :cooperative
  belongs_to :removal_order, optional: true
  validates :name,
            :address,
            :contact,
            :withdrawal, presence: true
end
