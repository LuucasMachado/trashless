require 'rails_helper'

feature 'Cooperative confirm withdrawal order' do
  scenario 'successfully' do
    user = User.create(email: 'jo@gmail.com', password: '12345678')
    cooperative = Cooperative.create(email: 'jo@gmail.com',
                                     password: '12345678',
                                     address: 'rua das figueiras')

    removal_order1 = RemovalOrder.create(weight: 10,
                                         removal_date_start: '01/09/2000',
                                         removal_date_end: '02/09/2000',
                                         address: 'rua das figueiras',
                                         description: 'Material feito de ferro',
                                         user: user, status: :open)

    removal_order2 = RemovalOrder.create(weight: 19,
                                         removal_date_start: '06/09/2000',
                                         removal_date_end: '08/09/2000',
                                         address: 'rua das figueiras',
                                         description: 'Material feito de ferro',
                                         user: user, status: :open)

    visit root_path
    click_on 'Logar como Filial'
    fill_in 'Email', with: cooperative.email
    fill_in 'Senha', with: cooperative.password
    click_on 'Logar'
    click_on 'Pedidos de retirada em aberto'
    within ".removal-order-#{removal_order1.id}" do
      click_on('Confirmar retirada')
    end

    removal_order1.reload
    removal_order2.reload
    expect(removal_order1.status).to eq 'close'
    expect(removal_order2.status).to eq 'open'
    expect(page).to have_content 'Pedido encerrado com sucesso!'
  end
end
