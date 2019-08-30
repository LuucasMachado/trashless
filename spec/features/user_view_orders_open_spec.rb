require 'rails_helper'
feature 'User view all orders open' do
  scenario 'successufully' do
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    RemovalOrder.create(weight: 10,
                        removal_date_start: '01/09/2000',
                        removal_date_end: '02/09/2000',
                        address: 'rua das bolinhas n 02',
                        description: 'Material feito de ferro',
                        user: user, status: :open)

    RemovalOrder.create(weight: 19,
                        removal_date_start: '06/09/2000',
                        removal_date_end: '08/09/2000',
                        address: 'rua das bolinhas n 88',
                        description: 'Material feito de ferro',
                        user: user, status: :close)

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Todos pedidos em aberto'

    expect(page).to have_content 'Pedidos em aberto'
    expect(page).to have_content '10'
    expect(page).to have_content '01/09/2000'
    expect(page).to have_content '02/09/2000'
    expect(page).to have_content 'rua das bolinhas n 02'

    expect(page).not_to have_content '19'
    expect(page).not_to have_content '06/09/2000'
    expect(page).not_to have_content '08/09/2000'
    expect(page).not_to have_content 'rua das bolinhas n 88'
  end
  scenario 'view only user order' do
    joao = User.create!(email: 'jo@gmail.com', password: '12345678')
    maria = User.create!(email: 'bla@gmail.com', password: '1111111')
    RemovalOrder.create(weight: 12,
                        removal_date_start: '12/09/2011',
                        removal_date_end: '04/09/2011',
                        address: 'rua das bolinhas n 05',
                        description: 'Material feito de ferro',
                        user: joao, status: :open)

    RemovalOrder.create(weight: 15,
                        removal_date_start: '06/09/2011',
                        removal_date_end: '08/09/2011',
                        address: 'rua das bolinhas n 88',
                        description: 'Material feito de ferro',
                        user: maria, status: :open)

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: 'jo@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Logar'
    click_on 'Todos pedidos em aberto'

    expect(page).to have_content 'Pedidos em aberto'
    expect(page).to have_content 'Peso: 12'
    expect(page).to have_content 'Data de retirada: 12/09/2011'
    expect(page).to have_content 'Limite de retirada: 04/09/2011'
    expect(page).to have_content 'Endereço: rua das bolinhas n 05'

    expect(page).not_to have_content 'Peso: 15'
    expect(page).not_to have_content 'Data de retirada: 08/09/2011'
    expect(page).not_to have_content 'Limite de retirada: 08/09/2011'
    expect(page).not_to have_content 'Endereço: rua das bolinhas n 88'
  end
end
