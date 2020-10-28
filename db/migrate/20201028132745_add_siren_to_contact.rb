class AddSirenToContact < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :siret
    add_column :contacts, :siren, :integer
  end
end
