class RemovalOrdersController < ApplicationController
  def new
    @removal_order = RemovalOrder.new
  end

  def show
    @removal_order = RemovalOrder.find(params[:id])
  end

  def create
    @removal_order = RemovalOrder.new(removal_order_params)
    if @removal_order.save 
      flash[:notice] = 'Pedido de remoção criado com sucesso'
      redirect_to @removal_order
    else
      flash[:notice] = 'Não foi possível salvar o pedido de remoçāo'
      render :new
    end
  end

  private
  def removal_order_params
    params.require(:removal_order).permit(:weight,
                                  :removal_date_start,
                                  :removal_date_end,
                                  :address)
  end
end