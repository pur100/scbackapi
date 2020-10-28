class Invoice < ApplicationRecord
  belongs_to :debtor
  validates :amount, presence: true
  validates :user_id, presence: true
  validates :file, presence: true
end
