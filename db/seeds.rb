# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    email: Faker::Internet.email,
    password: "123321"
  },
  {
    email: Faker::Internet.email,
    password: "123321"
  },
]

users.each do |coop|
  User.create(email: coop[:email], password: coop[:password])
end

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
  RemovalOrder.create!(user: User.first, 
                       address: address, 
                       weight: 10.0, 
                       removal_date_start: Date.today, 
                       removal_date_end: Date.today + 1,
                       description: "remover lixo em #{address}"
                      )
end

user = User.create(email: 'user@email.com', password: '12345678')
coop = Cooperative.create(email: 'coop@email.com', password: '12345678')
garbage_man = FactoryBot.create(:garbage_man, name: 'Lucas', cooperative: coop)
              FactoryBot.create(:garbage_man, name: 'Josy', cooperative: coop)
              FactoryBot.create(:garbage_man, name: 'Matheus', cooperative: coop)
RemovalOrder.create(weight: 10,
                   removal_date_start: '01/09/2000',
                   removal_date_end: '02/09/2000',
                   address: 'rua das bolinhas n 02',
                   description: 'Material feito de ferro',
                   garbage_man: garbage_man,
                   user: user, status: :open)
RemovalOrder.create(weight: 200,
   removal_date_start: '01/09/2000',
   removal_date_end: '02/09/2000',
   address: 'rua das bolinhas n 02',
   description: 'Material feito de ferro',
   garbage_man: garbage_man,
   user: user, status: :close)
RemovalOrder.create(weight: 10,
                   removal_date_start: '01/09/2000',
                   removal_date_end: '02/09/2000',
                   address: 'rua das bolinhas n 02',
                   description: 'Material feito de ferro',
                   garbage_man: garbage_man,
                   user: user, status: :close)