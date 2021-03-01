class Invoice < ApplicationRecord
  validates :amount, presence: true
  validates :user_id, presence: true

  # has_one_attached :file
end
