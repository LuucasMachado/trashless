class RemovalOrder < ApplicationRecord
  belongs_to :user
  belongs_to :garbage_man, optional: true
  enum status: { open: 0, in_progress: 1 , close: 5 }
  validates :weight, :removal_date_start, :removal_date_end,
            :address, presence: true

  validate :garbage_man_must_exist, on: :accept_removal_order
  
  def garbage_man_must_exist
    if garbage_man.nil?
      errors.add(:garbar_man, 'Necessário indicar um coletor')
    end
  end
  
  def order_title
    "##{id}-#{weight}"
  end
end
