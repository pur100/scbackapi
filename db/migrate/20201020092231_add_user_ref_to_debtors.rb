class AddUserRefToDebtors < ActiveRecord::Migration[6.0]
  def change
    add_reference :debtors, :user, foreign_key: true
  end
end
