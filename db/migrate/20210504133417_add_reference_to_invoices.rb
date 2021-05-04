class AddReferenceToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :reference, :integer
  end
end
