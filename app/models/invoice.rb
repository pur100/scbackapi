class Invoice < ApplicationRecord
  STATUS = ["En attente", "En cours de traitement", "Créance recouvrée", "Fermée"]

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :status, presence: true, inclusion: {in: STATUS}

  # has_one_attached :file
end
