class RemoveDebtorAgainFromInvoice < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :debtor_id
  end
end
