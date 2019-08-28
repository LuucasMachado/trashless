class RemovalOrder < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  enum status: { open: 0, close: 5 }
  validates :weight, :removal_date_start, :removal_date_end,
            :description, :address, presence: true
end
