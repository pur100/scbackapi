class CreateDebtors < ActiveRecord::Migration[6.0]
 def change
   create_table :debtors do |t|
     t.string :siret
     t.string :contact_name
     t.string :contact_phone
     t.string :contact_mail

     t.timestamps
   end
 end
end
