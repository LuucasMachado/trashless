class RemovalOrder < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  belongs_to :user
  has_one_attached :photo
  validates :weight, :removal_date_start, :removal_date_end,
            :description, :address, presence: true
  
  belongs_to :garbage_man, optional: true
  enum status: { open: 0, in_progress: 1, in_problem: 2, close: 5 }

  validate :garbage_man_must_exist, on: :accept_removal_order
  
  def garbage_man_must_exist
    errors.add(:garbar_man, 'Necessário indicar um coletor') if garbage_man.nil?
  end

  def order_title
    "##{id}-#{weight}"
  end
end
