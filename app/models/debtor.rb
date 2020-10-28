class Debtor < ApplicationRecord
  belongs_to :user
  validates :siret, presence: true, length: { in: 9..15 }
end
