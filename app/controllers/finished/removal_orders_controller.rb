class Finished::RemovalOrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @removal_orders = current_user.removal_orders.close
  end
end
