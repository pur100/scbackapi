class ChangeAmountOnInvoices < ActiveRecord::Migration[6.0]
  def change
        change_column :invoices, :amount, :decimal
  end
end
