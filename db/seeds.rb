# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

addresses = [
  'rua barra funda',
  'avenida paulista',
  'avenida 23 de maio',
  'bairro jardim',
  'sao paulo',
  'rua napoleao',
  'rua ibituruna'
]

addresses.each do |address|
  RemovalOrder.create!(user: FactoryBot.create(:user), 
                      address: address, 
                      weight: 10.0, 
                      removal_date_start: Date.today, 
                      removal_date_end: Date.today + 1,
                      description: "remover lixo em #{address}"
                      )
end

coops = [
  {
    email: "bragamat@trashless.com",
    password: "123321"
  },
  {
    email: "bragamat1@trashless.com",
    password: "123321"
  },
]

coops.each do |coop|
  Cooperative.create!(email: coop[:email], password: coop[:password])
end