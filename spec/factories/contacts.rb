FactoryBot.define do
  factory :contact do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    message { "MyText" }
    siret { 1 }
  end
end
