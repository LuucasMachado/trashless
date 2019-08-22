class RemovalOrdersController < ApplicationController
  def new
    @removal_order = RemovalOrder.new
  end

  def create
    
  end

  private
  def removal_order_params
    params.require(:removal_order).permit(:weight,
                                  :removal_date_start,
                                  :removal_date_end,
                                  :address)
  end
end