require 'rails_helper'

describe 'Removal order problems' do
  it 'and only logged users can create' do
    removal_order = create(:removal_order, status: :open)

    post removal_order_removal_order_problems_path(removal_order), params: {}

    expect(response).to redirect_to(root_path)
  end
end
