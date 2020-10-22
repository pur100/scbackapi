class Invoice < ApplicationRecord
  belongs_to :debtor
  validates :amount, presence: true
  validates :debtor_id, presence: true
  validates :file, presence: true
end
