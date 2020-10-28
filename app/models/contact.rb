class Contact < ApplicationRecord
  store_accessor :company, :company_name, :company_address, :company_zip, :company_city, :siret
end
