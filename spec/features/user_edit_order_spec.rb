
require 'rails_helper'

feature 'User edit order'  do
  scenario 'successufully' do 
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    open_removal = RemovalOrder.create(weight: 10,
                                         removal_date_start: '01/09/2019',
                                         removal_date_end: '02/09/2019',
                                         address: 'rua das bolinhas n 02',
                                         user: user, status: :open)

   visit root_path
   fill_in 'Email', with: user.email
   fill_in 'Senha', with: user.password 
   click_on 'Logar'
   click_on 'Todos pedidos em aberto'
   click_on 'Ver detalhes'
   click_on 'Editar'

   fill_in 'Peso', with: '12'
   fill_in 'Data de retirada', with: '02/09/2019'
   fill_in 'Limite de retirada', with: '03/09/2019'
   fill_in 'Endereço', with: 'rua das bananas n 02'
   click_on 'Enviar'

   expect(page).to have_content('Peso: 12')
   expect(page).to have_content('Data de retirada: 02/09/2019')
   expect(page).to have_content('Limite de retirada: 03/09/2019')
   expect(page).to have_content('Endereço: rua das bananas n 02')
  end

  
end