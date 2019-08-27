require 'rails_helper'

feature 'user cancel order' do
  scenario 'successfully' do
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    removal_order = RemovalOrder.create(weight: 10,
                        removal_date_start: '01/09/2019',
                        removal_date_end: '02/09/2019',
                        address: 'rua das bolinhas n 02',
                        user: user, status: :open)

    visit root_path
    click_on 'Logar como Usuario'
    fill_in 'Email', with: 'jo@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Logar'
    click_on 'Todos pedidos em aberto'
    find("a[href='/removal_orders/#{removal_order.id}']").click
    click_on 'Apagar pedido'

    expect(page).to have_content 'Pedido apagado com sucesso!'
    expect(page).not_to have_css('li', text: 'Data de retirada: 01/09/2019')
    expect(page).not_to have_css('li', text: 'Limite de retirada: 02/09/2019')
    expect(page).not_to have_css('li', text: 'Endereço: rua das bolinhas n 02')
  end
end
