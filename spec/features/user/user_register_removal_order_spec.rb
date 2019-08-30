require 'rails_helper'

feature 'User register removal order' do
  scenario 'successfully' do
    user = create(:user, email: 'lucas@hotmail.com')

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Registrar coleta'
    fill_in 'Peso', with: '244'
    fill_in 'Data retirada inicio', with: '14/09/2019'
    fill_in 'Limite de retirada', with: '20/09/2019'
    fill_in 'Endereço', with: 'Rua Ruan Juan Jackson'
    fill_in 'Descrição', with: 'sao 244kg de ferro 2x2'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'lixo.jpeg')
    click_on 'Registra coleta'

    expect(page).to have_content 'Peso 244.0 kg'
    expect(page).to have_content 'Data retirada inicio 14/09/2019'
    expect(page).to have_content 'Data retirada fim 20/09/2019'
    expect(page).to have_content 'Endereço Rua Ruan Juan Jackson'
    expect(page).to have_content 'Descrição sao 244kg de ferro 2x2'
    expect(page).to have_css('img[src*="lixo.jpeg"]')
  end
  scenario 'and must fill in all fields' do
    user = create(:user, email: 'lucas@hotmail.com', password: '123321')

    visit root_path
    click_on 'LOGAR COMO USUÁRIO'
    fill_in 'Email', with: 'lucas@hotmail.com'
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Registrar coleta'
    fill_in 'Peso', with: ''
    fill_in 'Data retirada inicio', with: ''
    fill_in 'Limite de retirada', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Registra coleta'

    expect(page).to have_content 'Não foi possível salvar o pedido de remoçāo'
    expect(page).to have_content 'Peso não pode ficar em branco'
    expect(page).to have_content 'Data retirada inicio não pode ficar em branco'
    expect(page).to have_content 'Data retirada inicio não pode ficar em branco'
    expect(page).to have_content 'Endereço não pode ficar em branco'
  end
end
