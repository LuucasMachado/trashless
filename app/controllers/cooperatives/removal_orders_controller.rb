class Cooperatives::RemovalOrdersController < ApplicationController
  before_action :authenticate_cooperative!
  def index
    @removal_orders = RemovalOrder.open
  end
end
