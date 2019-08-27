require 'rails_helper'

RSpec.describe RemovalOrder, type: :model do
  describe '#order_title' do
    it 'should return title in format #{id-weight}' do
      coop = create(:cooperative)
      user = create(:user)
      create(:garbage_man, cooperative: coop)
      removal_order = create(:removal_order, user: user, status: :open)

      expect(removal_order.order_title).to eql "##{removal_order.id}-#{removal_order.weight}"
    end
  end
end
