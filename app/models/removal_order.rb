class RemovalOrder < ApplicationRecord
  enum status: { open: 0, close: 5 }
end
