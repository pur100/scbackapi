class RemoveDebtorFromInvoice < ActiveRecord::Migration[6.0]
  def self.down
      change_table :invoices do |t|
        t.remove :debtor_id
      end
    end
end
