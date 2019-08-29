require 'rails_helper'

RSpec.describe RemovalOrder, type: :model do
  describe 'RemovalOrder gerenerate map' do
    it 'successfully' do
      josy = User.create(email: 'joosy@gmail.com', password: '12345678')
      removal = RemovalOrder.new(weight: 10, removal_date_start: '2019-08-09',
                                 removal_date_end: '2019-08-10',
                                 address: 'Paris', user: josy)
      removal.save!
      expect(removal.latitude.to_f).to eq 48.8566101
      expect(removal.longitude.to_f).to eq 2.3514992
    end
  end
  describe '#order_title' do
    it 'should return title in format id-weight' do
      coop = create(:cooperative)
      user = create(:user)
      create(:garbage_man, cooperative: coop)
      removal_order = create(:removal_order, user: user, status: :open)

      expect(removal_order.order_title).to eql(
        "##{removal_order.id}-#{removal_order.weight}"
      )
    end
  end
end
