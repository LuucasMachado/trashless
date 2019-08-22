class RemovalOrdersController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @removal_orders = RemovalOrder.open
  end

  def new
    @user = User.find(params[:user_id])
    @removal_order = RemovalOrder.new
  end  

  def create
    #@user = User.find(params[:user_id])
    @removal_order = RemovalOrder.new(removal_order_params)
    @removal_order.open!
    @removal_order.save
    redirect_to @removal_order 
  end    

  def show
    @user = User.find(params[:user_id])
    @removal_order = RemovalOrder.find(params[:id])
  end  

  private

  def removal_order_params
    params.require(:removal_order).permit(:weight, :removal_date_start,
                                          :removal_date_end, :address)
  end  
end

