class HomeController < ApplicationController
  def index
    return render :index unless cooperative_signed_in?

    @cooperative = current_cooperative
    @removal_orders = RemovalOrder.near(@cooperative.address)
    render 'cooperatives/index'
  end
end
