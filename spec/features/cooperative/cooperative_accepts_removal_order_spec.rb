require 'rails_helper'

feature 'Cooperative accepts a removal order' do
  scenario 'successfully' do
    coop = create(:cooperative)
    user = create(:user)
    garbage_man = create(:garbage_man, cooperative: coop)
    removal_order = create(:removal_order, user: user, status: :open)
    login_as(coop, scope: :cooperative)
    visit removal_order_path(removal_order)
    select garbage_man.name, from: 'Coletor'
    click_on 'aceitar'

    expect(page).to have_content('status: em andamento')
    expect(page).to have_content('Pedido aceito')
    expect(page).to have_content(removal_order.order_title)
    expect(page).to have_content("coletor: #{garbage_man.name}")
  end

  scenario 'not allowed without colector' do
    coop = create(:cooperative)
    user = create(:user)
    removal_order = create(:removal_order, user: user, status: :open)
    create(:garbage_man, cooperative: coop)

    login_as(coop, scope: :cooperative)
    visit removal_order_path(removal_order)
    find("option[value='']").click
    click_on 'aceitar'

    expect(page).to have_content('status: aberto')
    expect(page).to have_content('Necessário indicar um coletor')
  end
end
