# module Support
#   RSpec.configure do |config|
#     config.include Warden::Test::Helpers
#   end
  
#   def login(user)
#     visit root_path
#     click_on 'Logar como Usuario'
#     fill_in 'Email', with: user.email
#     fill_in 'Senha', with: user.password
#     click_on 'Logar'
#   end
# end