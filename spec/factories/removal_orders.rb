FactoryBot.define do
  factory :removal_order do
    weight { '9.99' }
    removal_date_start { '2019-08-21 20:46:52' }
    removal_date_end { '2019-08-21 20:46:52' }
    address { 'MyString' }
    description { 'Saco de lixo com muito ferro' }
    user
  end
end
