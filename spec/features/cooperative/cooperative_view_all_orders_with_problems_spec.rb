require 'rails_helper'

feature 'Cooperative view orders' do
  scenario 'with problems' do
    coop = create(:cooperative)
    lucas = create(:user, email: 'lucar@trahsless.com')
    maria = create(:user, email: 'maria@trahsless.com')
    removal_order = create(:removal_order, user: maria, status: :in_problem)
    removal_order_with_problem = create(:removal_order, user: maria, status: :in_problem)
    2.times do
      create(:removal_order, user: maria, status: :in_problem)
    end
    10.times do 
      create(:removal_order, user: lucas, status: :open)
    end
    

    login_as(coop, scope: :cooperative)
    visit removal_orders_path, status: :in_problem
    expect(page).to_not have_content(removal_order.order_title)
    expect(page).to have_content(removal_order_with_problem.order_title)
    expect(page).to have_content('status: com problema', count: 3)
  end
end