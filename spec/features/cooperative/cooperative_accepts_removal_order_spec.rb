require 'rails_helper'

feature 'Cooperative accepts a removal order' do
  scenario 'successfully' do
    coop = create(:cooperative)
    user = create(:user)
    garbage_man = create(:garbage_man, cooperative: coop)
    removal_order = create(:removal_order, user: user, status: :open)
    
    sign_in (coop)
    visit "/removal_order/#{removal_order.id}"
    select garbage_man.name, :from => "Coletor"
    click_on "aceitar"

    expect(page).to have_content("#{removal_order.order_title}")
    expect(page).to have_content("coletor: #{garbage_man.name}")
    expect(page).to have_content("status: em andamento")
  end
end