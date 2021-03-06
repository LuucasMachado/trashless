require 'rails_helper'

feature 'Cooperative register collector' do
  scenario 'successfully' do
    lucas = User.create(email: 'lucas@gmail.com', password: '123456')
    RemovalOrder.create!(weight: 10,
                         removal_date_start: '08/09/2019',
                         removal_date_end: '02/10/2019',
                         description: 'Material feito de ferro',
                         address: 'avenida paulista',
                         user: lucas, status: :open)
    maria = User.create!(email: 'maria@gmail.com', password: '654321')
    RemovalOrder.create!(weight: 15,
                         removal_date_start: '01/09/2019',
                         removal_date_end: '12/09/2019',
                         address: 'rua das batatas 34',
                         description: 'Material feito de ferro',
                         user: maria, status: :close)

    user = create(:cooperative, address: 'rua barra funda')
    visit root_path
    click_on 'LOGAR COMO FILIAL'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Pedidos de retirada em aberto'

    expect(page).to have_content 'Endereço Solicitante: avenida paulista'
    expect(page).to have_content 'Data de retirada: 08/09/2019'
    expect(page).to have_content 'Data limite de retirada: 02/10/2019'
    expect(page).to have_content 'Peso: 10'
    expect(page).not_to have_content 'Endereço Solicitante: rua das batatas 34'
    expect(page).not_to have_content 'Data de retirada: 01/09/2019'
    expect(page).not_to have_content 'Data limite de retirada: 12/09/2019'
    expect(page).not_to have_content 'Peso: 15'
  end

  scenario 'show link login as cooperative' do
    visit cooperatives_removal_orders_path

    expect(current_path).to eq new_cooperative_session_path
  end

  scenario 'has not removals' do
    user = create(:cooperative, address: 'rua barra funda')

    visit root_path
    click_on 'LOGAR COMO FILIAL'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Pedidos de retirada em aberto'

    expect(page).to have_content 'Nenhum pedido em aberto'
  end
end
