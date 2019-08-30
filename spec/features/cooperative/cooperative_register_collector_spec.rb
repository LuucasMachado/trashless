require 'rails_helper'

feature 'Cooperative register collector' do
  scenario 'successfully' do
    user = create(:cooperative, address: 'rua barra funda')
    visit root_path
    click_on 'LOGAR COMO FILIAL'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Coletador'
    click_on 'Registrar coletador'
    fill_in 'Nome', with: 'Stephen Curry do Brasil'
    fill_in 'Endereço', with: 'Rua pedro joao 223'
    fill_in 'Contato', with: '11986215723'
    fill_in 'Meio de retirada', with: 'Carro manual'
    click_on 'Registra coletador'

    expect(page).to have_content 'Coletador criado com sucesso'
    expect(page).to have_content 'Nome: Stephen Curry do Brasil'
    expect(page).to have_content 'Endereço: Rua pedro joao 223'
    expect(page).to have_content 'Contato: 11986215723'
    expect(page).to have_content 'Meio de retirada: Carro manual'
  end
  scenario 'and must fill in all fields' do
    user = create(:cooperative, address: 'rua barra funda')
    visit root_path
    click_on 'LOGAR COMO FILIAL'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Coletador'
    click_on 'Registrar coletador'
    fill_in 'Nome', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Contato', with: ''
    fill_in 'Meio de retirada', with: ''
    click_on 'Registra coletador'

    expect(page).to have_content 'Não foi possível criar o coletador'
  end
end
