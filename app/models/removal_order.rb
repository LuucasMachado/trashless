class RemovalOrder < ApplicationRecord
  belongs_to :user
  enum status: { open: 0, close: 5 }
  validates :weight, :removal_date_start, :removal_date_end,
            :address, presence: true

  has_many :removal_order_problems, dependent: :destroy
end
