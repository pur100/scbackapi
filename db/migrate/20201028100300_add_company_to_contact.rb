class AddCompanyToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :company, :jsonb, :null => false, :default => {}
    add_index  :contacts, :company, using: :gin
  end
end
