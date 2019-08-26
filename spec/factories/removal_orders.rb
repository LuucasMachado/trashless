FactoryBot.define do
  factory :removal_order do
    weight { '9.99' }
    removal_date_start { '2019-08-21' }
    removal_date_end { '2019-08-21' }
    address { 'MyString' }
  end
end
