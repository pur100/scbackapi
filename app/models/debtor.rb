class Debtor < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :siret, presence: true, length: { in: 9..15 }
end
