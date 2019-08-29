class RemovalOrder < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, :description, :address, presence: true

  belongs_to :user
  belongs_to :garbage_man, optional: true
  has_one_attached :photo

  has_many :removal_order_problems, dependent: :destroy
  validates :weight, :removal_date_start, :removal_date_end, :address,
            presence: true
  enum status: { open: 0, in_progress: 1, in_problem: 2, close: 5 }

  validate :garbage_man_must_exist, on: :accept_removal_order

  def garbage_man_must_exist
    errors.add(:garbar_man, 'Necessário indicar um coletor') if garbage_man.nil?
  end

  def order_title
    "##{id}-#{weight}"
  end
end
