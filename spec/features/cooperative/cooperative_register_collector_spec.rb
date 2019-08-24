require 'rails_helper'

feature 'Cooperative register collector' do
  scenario 'successfully' do
    user = create(:cooperative)
    visit root_path
    click_on 'Logar como filial'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
    click_on 'Registrar coletador'
    fill_in 'Nome:', with: 'Stephen Curry do Brasil'
    fill_in 'Endereço:', with: 'Rua pedro joao 223'
    fill_in 'Contato:', with: '11986215723'
    fill_in 'Meio de retirada:', with: 'Carro manual'
      byebug
    click_on 'Registra coletador'

    expect(page).to have_content 'Coletador criado com sucesso'
    expect(page).to have_content 'Nome: Stephen Curry do Brasil'
    expect(page).to have_content 'Endereço: Rua pedro joao 223'
    expect(page).to have_content 'Contato: 11986215723'
    expect(page).to have_content 'Meio de retirada: Carro manual'
  end
end