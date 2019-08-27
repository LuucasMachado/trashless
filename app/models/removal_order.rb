class RemovalOrder < ApplicationRecord
  belongs_to :user
  has_one :garbage_man
  enum status: { open: 0, in_progress: 1 , close: 5 }
  validates :weight, :removal_date_start, :removal_date_end,
            :address, presence: true
  
  # def order_title
  #   "##{id}#{weight}-#{removal_date_start}"
  # end
end
