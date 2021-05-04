class ChangeReferenceOnInvoices < ActiveRecord::Migration[6.0]
  def change
    change_column :invoices, :reference, :string
  end
end
