require 'rails_helper'

feature 'User report a problem on removal order' do
  scenario 'successfully', :js do
    user = create(:user)
    create(:removal_order, user: user, status: :open)

    login_as user, scope: :user
    visit root_path
    click_on 'Todos pedidos em aberto'
    click_on 'Ver detalhes'
    click_on 'Reportar um problema'
    fill_in 'Informações', with: 'Não encontrei este endereço'
    click_on 'Enviar'

    expect(page).to have_content('Não encontrei este endereço')
  end

  scenario 'must fill in all fields', :js do
    user = create(:user)
    create(:removal_order, user: user, status: :open)

    login_as user, scope: :user
    visit root_path
    click_on 'Todos pedidos em aberto'
    click_on 'Ver detalhes'
    click_on 'Reportar um problema'
    click_on 'Enviar'

    expect(page).to have_content('Preencha todas as informações')
  end
end
