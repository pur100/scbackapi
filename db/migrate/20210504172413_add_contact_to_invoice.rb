class AddContactToInvoice < ActiveRecord::Migration[6.0]
  def change
        add_column :invoices, :contact_tel, :string
        add_column :invoices, :contact_mail, :string
  end
end
