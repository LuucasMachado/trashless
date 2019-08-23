class RemovalOrdersController < ApplicationController
  def index
    @removal_orders = RemovalOrder.open
  end  
end  