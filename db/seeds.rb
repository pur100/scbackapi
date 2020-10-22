# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning db except users"

ds = Debtor.all

ds.each do |d|
  d.destroy
end

puts "clean"

u = User.create(email: "testi@test.com", password: "testicu", password_confirmation:"testicu")

30.times do
  d = Debtor.new(user_id: u.id, contact_name: Faker::Name.name, contact_mail: Faker::Internet.email,siret: "1672890975" ,contact_phone: Faker::PhoneNumber.cell_phone)
  d.save!
  puts "debtors created"
end

90.times do
  offset = rand(Debtor.count)
  d = Debtor.offset(offset).first
  i = Invoice.new(user_id: d.user_id, debtor_id: d.id, amount: rand(100..19999), file:"https://picsum.photos/seed/picsum/200/300")
  i.save!
  puts "invoices created"
end

puts "done seeding"
