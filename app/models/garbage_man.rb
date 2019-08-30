class GarbageMan < ApplicationRecord
  belongs_to :cooperative
  belongs_to :removal_order, optional: true
  validates :name,
            :address,
            :contact,
            :withdrawal, presence: true
  enum status: { enable: 0, disabled: 1, cancel: 2 }
end
