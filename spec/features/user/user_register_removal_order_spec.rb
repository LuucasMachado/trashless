require 'rails_helper'

feature 'User register removal order' do
  scenario 'successfully' do
    user = create(:user, email: 'lucas@hotmail.com')

    visit root_path
    click_on 'Logar como Usuario'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Registrar coleta'
    fill_in 'Peso', with: '244'
    fill_in 'Data retirada inicio', with: '14/06/2019'
    fill_in 'Limite de retirada', with: '14/07/2019'
    fill_in 'Endereço', with: 'Rua Ruan Juan Jackson'
    click_on 'Registra coleta'

    expect(page).to have_content 'Peso 244.0 kg'
    expect(page).to have_content 'Data retirada inicio 14/06/2019'
    expect(page).to have_content 'Data retirada fim 14/07/2019'
    expect(page).to have_content 'Endereço Rua Ruan Juan Jackson'
  end
  scenario 'and must fill in all fields' do
    user = create(:user, email: 'lucas@hotmail.com')

    visit root_path
    click_on 'Logar como Usuario'
    fill_in 'Email', with: 'lucas@hotmail.com'
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Registrar coleta'
    fill_in 'Peso', with: ''
    fill_in 'Data retirada inicio', with: ''
    fill_in 'Limite de retirada', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Registra coleta'

    expect(page).to have_content 'Não foi possível salvar o pedido de remoçāo'
  end
end
