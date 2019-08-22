class RemovalOrder < ApplicationRecord
  validates :weight, :removal_date_start, :removal_date_end, :address, presence: true
end
