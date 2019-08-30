class RemovalOrder < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, :description, :address, presence: true

  belongs_to :user
  has_one_attached :photo
  validates :weight, :removal_date_start, :removal_date_end, :address,
            presence: true
  belongs_to :garbage_man, optional: true
  enum status: { open: 0, in_progress: 1, in_problem: 2, close: 5 }

  validate :removal_date_at_least_today,
            unless: -> { removal_date_start.nil? }
  validate :period_end_greather_than_period_start,
            unless: -> { removal_date_start.nil? || removal_date_end.nil? }
  validate :garbage_man_must_exist, on: :accept_removal_order

  def garbage_man_must_exist
    errors.add(:garbar_man, 'Necessário indicar um coletor') if garbage_man.nil?
  end

  def order_title
    "##{id}-#{weight}"
  end

  def removal_date_at_least_today
    if removal_date_start < Date.today
      errors.add(:removal_date_start, 'data de retirada inválida')
    end
  end

  def period_end_greather_than_period_start
    if removal_date_end < removal_date_start
      errors.add(:removal_date_end, 'data de limite inválida')
    end
  end


end
