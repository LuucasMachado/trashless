require 'rails_helper'

  feature 'User view all orders open' do
    scenario 'successufully' do

      user = create(:user)
      
      open_removal =  RemovalOrder.create(weight: 10, 
                                           removal_date_start: "01/09/2019", 
                                           removal_date_end: "02/09/2019",
                                           address: 'rua das bolinhas n 02')
      open_removal.open!      
      
      close_removal =  RemovalOrder.create(weight: 20, 
        removal_date_start: "01/09/2019", 
        removal_date_end: "02/09/2019",
        address: 'rua das bananas n 02')
        open_removal.close! 

      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      click_on 'Log in'
      click_on 'Todos os pedidos em aberto'
      
      expect(page).to have_content('Pedidos em abertos')
      expect(page).to have_content(open_removal.weight)
      expect(page).to have_content(open_removal.removal_date_start)
      expect(page).to have_content(open_removal.removal_date_end)
      expect(page).to have_content(open_removal.address)
    end  
  end  