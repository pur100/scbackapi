class AddDataToUsers < ActiveRecord::Migration[6.0]
   def change
    add_column :users, :company_name, :string
    add_column :users, :company_siret, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tel, :integer
  end
end
