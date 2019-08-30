require 'rails_helper'
feature 'User view all orders open' do
  scenario 'successufully' do
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    RemovalOrder.create(weight: 10,
                        removal_date_start: '01/09/2000',
                        removal_date_end: '02/09/2000',
                        address: 'rua das bolinhas n 02',
                        description: 'Material feito de ferro',
                        user: user, status: :close)

    RemovalOrder.create(weight: 19,
                        removal_date_start: '06/09/2000',
                        removal_date_end: '08/09/2000',
                        address: 'rua das bolinhas n 88',
                        user: user, status: :open)

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Meus pedidos encerrados'

    expect(page).to have_content 'Total de lixo retirado: 10'
    expect(page).to have_content 'Pedidos encerrados'
    expect(page).to have_content 'Total de pedidos encerrados: 1'
    expect(page).to have_content 'Data de retirada: 01/09/2000'
    expect(page).to have_content 'Endereço: rua das bolinhas n 02'

    expect(page).not_to have_content 'Data de retirada: 06/09/2000'
    expect(page).not_to have_content 'Endereço: rua das bolinhas n 88'
  end

  scenario 'view only user removals closed' do
    joao = User.create(email: 'jo@gmail.com', password: '12345678')
    maria = User.create(email: 'maria@gmail.com', password: '8765432')

    RemovalOrder.create(weight: 10,
                        removal_date_start: '01/09/2000',
                        removal_date_end: '02/09/2000',
                        address: 'rua das bolinhas n 02',
                        description: 'Material feito de ferro',
                        user: joao, status: :close)

    RemovalOrder.create(weight: 19,
                        removal_date_start: '06/09/2000',
                        removal_date_end: '08/09/2000',
                        address: 'rua das bolinhas n 88',
                        user: maria, status: :close)

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: joao.email
    fill_in 'Senha', with: joao.password
    click_on 'Logar'
    click_on 'Meus pedidos encerrados'

    expect(page).to have_content 'Pedidos encerrados'
    expect(page).to have_content 'Total de pedidos encerrados: 1'
    expect(page).to have_content 'Total de lixo retirado: 10'
    expect(page).to have_content 'Data de retirada: 01/09/2000'
    expect(page).to have_content 'Endereço: rua das bolinhas n 02'

    expect(page).not_to have_content 'Total de lixo retirado: 29'
    expect(page).not_to have_content 'Data de retirada: 06/09/2000'
    expect(page).not_to have_content 'Endereço: rua das bolinhas n 88'
  end
end
