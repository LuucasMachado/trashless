require 'rails_helper'

feature 'Cooperative accepts a removal order' do
  scenario 'successfully' do
    coop = create(:cooperative)
    user = create(:user)
    garbage_man = create(:garbage_man, cooperative: coop)
    removal_order = create(:removal_order, user: user, status: :open)
    
    login_as(coop, :scope => :coop)
    visit "/removal_orders/#{removal_order.id}"
    save_page
    select garbage_man.name, from: 'Coletor'
    click_on 'aceitar'

    expect(page).to have_content('status: em andamento')
    expect(page).to have_content('Pedido aceito')
    expect(page).to have_content("##{removal_order.id}-#{removal_order.weight}")
    expect(page).to have_content("coletor: #{garbage_man.name}")
  end
end
