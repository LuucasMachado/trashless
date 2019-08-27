class GarbageMen < ApplicationRecord
  belongs_to :cooperative
  validates :name,
            :address,
            :contact,
            :withdrawal, presence: true
end
