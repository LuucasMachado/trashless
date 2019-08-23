class RemovalOrdersController < ApplicationController
  
  def index
    @removal_orders = current_user.removal_orders.where(status: :open)
  end

  def new
    @removal_order = RemovalOrder.new
  end  

  def create
    @removal_order = RemovalOrder.new(removal_order_params)
    @removal_order.open!
    @removal_order.save
    redirect_to @removal_order 
  end    

  def show
    @removal_order = RemovalOrder.find(params[:id])
  end  

  def edit
    @removal_order = RemovalOrder.find(params[:id])
  end  

  def update
    @removal_order = RemovalOrder.find(params[:id])
    if @removal_order.update(removal_order_params)
      redirect_to @removal_order
    end  
  end  

  private

  def removal_order_params
    params.require(:removal_order).permit(:weight, :removal_date_start,
                                          :removal_date_end, :address)
  end  
end

