class User < ApplicationRecord
  has_secure_password
  has_many :debtors
  has_many :invoices
end
