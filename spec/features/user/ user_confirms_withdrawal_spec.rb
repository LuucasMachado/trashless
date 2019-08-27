
feature 'User confirm withdrawal order' do
  scenario 'successfully' do
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    removal_order1 = RemovalOrder.create(weight: 10,
                        removal_date_start: '01/09/2000',
                        removal_date_end: '02/09/2000',
                        address: 'rua das bolinhas n 02',
                        user: user, status: :open)

    removal_order2 = RemovalOrder.create(weight: 19,
                        removal_date_start: '06/09/2000',
                        removal_date_end: '08/09/2000',
                        address: 'rua das bolinhas n 88',
                        user: user, status: :open)

    visit root_path
    click_on 'Logar como Usuario'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Todos pedidos em aberto'
    within ".removal-order-#{removal_order1.id}" do
      click_on('Confirmar retirada')
    end

    removal_order1.reload
    expect(removal_order1.status).to eq 'close'
    expect(removal_order2.status).to eq 'open'
    expect(page).to have_content 'Pedido encerrado com sucesso!'
  end
end