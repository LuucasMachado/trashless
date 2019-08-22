require 'rails_helper'

feature 'User view all orders open'  do
	scenario 'successufully' do 
    user = User.create(email: 'jo@gmail.com', password: '12345678')

    open_removal_1 = RemovalOrder.create(weight: 10,
                                         removal_date_start: '01/09/2019',
                                         removal_date_end: '02/09/2019',
                                         address: 'rua das bolinhas n 02',
                                         user: user, status: :open)


    open_removal_2 = RemovalOrder.create(weight: 19,
                                         removal_date_start: '06/09/2019',
                                         removal_date_end: '08/09/2019',
                                         address: 'rua das bolinhas n 88',
                                         user: user, status: :close)


     visit root_path
     fill_in 'Email', with: user.email
     fill_in 'Senha', with: user.password 
     click_on 'Logar'
     click_on 'Todos pedidos em aberto'

     expect(page).to have_content('Pedidos em aberto')
     expect(page).to have_content(open_removal_1.weight)
     expect(page).to have_content(open_removal_1.removal_date_start)
     expect(page).to have_content(open_removal_1.removal_date_end)
     expect(page).to have_content(open_removal_1.address)

     expect(page).not_to have_content(open_removal_2.weight)
     expect(page).not_to have_content(open_removal_2.removal_date_start)
     expect(page).not_to have_content(open_removal_2.removal_date_end)
     expect(page).not_to have_content(open_removal_2.address)
  end
end 