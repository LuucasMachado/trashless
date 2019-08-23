class RemovalOrder < ApplicationRecord
  belongs_to :user
  enum status: { open: 0, close: 5 }
end
