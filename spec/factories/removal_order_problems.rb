FactoryBot.define do
  factory :removal_order_problem do
    user { nil }
    cooperative { nil }
    removal_order { nil }
    comment { 'MyText' }
  end
end
