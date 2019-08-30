require 'rails_helper'

feature 'Cooperative register collector' do
  scenario 'successfully' do
    user = create(:cooperative)
    collector = GarbageMan.create(name: 'Stephen Curry do Brasil',
                                  address: 'Rua napoleao de barros',
                                  contact: '111',
                                  withdrawal: 'asasas',
                                  cooperative: user)
    allow(RemovalOrder).to receive(:near).and_return([])
    visit root_path
    click_on 'LOGAR COMO FILIAL'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Logar'
    click_on 'Coletador'
    click_on 'Stephen Curry do Brasil'
    click_on 'Desativar coletador'

    collector.reload
    expect(page).to have_content 'Coletador desativado com sucesso'
    expect(collector.status).to eq 'disabled'
  end
end
