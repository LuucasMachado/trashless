require 'rails_helper'

feature 'Cooperative view orders in Map' do
  scenario 'successfully' do
    coop = create(:cooperative)
    lucas = create(:user, email: 'lucar@trahsless.com')
    10.times do
      create(:removal_order, user: lucas, status: :open)
    end

    login_as(coop, scope: :cooperative)
    visit removal_orders_path

    expect(page).to have_content('status: aberto', count: 10)
  end
end
