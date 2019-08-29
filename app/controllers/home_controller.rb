class HomeController < ApplicationController
  def index
    if cooperative_signed_in?
      @cooperative = current_cooperative
      @removal_orders = RemovalOrder.near(@cooperative)
      render 'cooperatives/index'
    end
  end
end
