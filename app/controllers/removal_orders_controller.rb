class RemovalOrdersController < ApplicationController
  def index
    @removal_orders = current_user.removal_orders.open
  end

  def new
    @removal_order = RemovalOrder.new
  end

  def show
    @removal_order = RemovalOrder.find(params[:id])
  end

  def destroy
    @removal_order = RemovalOrder.find(params[:id])
    @removal_order.destroy
    
    notice = "Pedido apagado com sucesso!"
    redirect_to removal_orders_path
  end

  def create
    @removal_order = RemovalOrder.new(removal_order_params)
    @removal_order.user = current_user
    if @removal_order.save
      flash[:notice] = 'Pedido de remoção criado com sucesso'
      redirect_to @removal_order
    else
      flash[:notice] = 'Não foi possível salvar o pedido de remoçāo'
      render :new
    end
  end
  
  def edit
    @removal_order = RemovalOrder.find(params[:id])
  end

  def update
    @removal_order = RemovalOrder.find(params[:id])
    if @removal_order.update(removal_order_params)
      flash[:notice] = 'Pedido editado com sucesso!'
      redirect_to @removal_order
    else
      flash[:error] = 'Você deve preencher todos os campos'
      render :edit
    end
  end

  private

  def removal_order_params
    params.require(:removal_order).permit(:weight, :removal_date_start,
                                          :removal_date_end, :address)
  end
end
