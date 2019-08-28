class RemovalOrderProblem < ApplicationRecord
  belongs_to :user
  belongs_to :removal_order

  validates :comment, presence: true
end
