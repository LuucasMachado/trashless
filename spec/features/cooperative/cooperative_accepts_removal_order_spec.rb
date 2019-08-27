require 'rails_helper'

feature 'Cooperative accepts a removal order' do
  before(:each) do
    @coop = create(:cooperative)
    @user = create(:user)
    @garbage_man = create(:garbage_man, cooperative: @coop)
    @removal_order = create(:removal_order, user: @user, status: :open)
  end

  scenario 'successfully' do
    login_as(@coop, scope: :coop)
    visit "/removal_orders/#{@removal_order.id}"
    select @garbage_man.name, from: 'Coletor'
    click_on 'aceitar'

    expect(page).to have_content('status: em andamento')
    expect(page).to have_content('Pedido aceito')
    expect(page).to have_content(@removal_order.order_title)
    expect(page).to have_content("coletor: #{@garbage_man.name}")
  end

  scenario 'not allowed without colector' do
    login_as(@coop, scope: :coop)
    visit "/removal_orders/#{@removal_order.id}"
    find("option[value='']").click
    click_on 'aceitar'

    expect(page).to have_content('status: aberto')
    expect(page).to have_content('Necessário indicar um coletor')
  end
end
