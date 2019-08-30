class RemovalOrderProblem < ApplicationRecord
  belongs_to :ownable, polymorphic: true
  belongs_to :removal_order

  validates :comment, presence: true
end
