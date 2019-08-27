class RemovalOrder < ApplicationRecord
  belongs_to :user
  belongs_to :garbage_man, optional: true
  enum status: { open: 0, in_progress: 1 , close: 5 }
  validates :weight, :removal_date_start, :removal_date_end,
            :address, presence: true
  
  # def order_title
  #   "##{id}#{weight}-#{removal_date_start}"
  # end
end
