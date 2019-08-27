class RemovalOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parms, only: [:show, :edit, :update, :destroy]
  def index
    @removal_orders = current_user.removal_orders.open
  end

  def new
    @removal_order = RemovalOrder.new
  end

  def show
    @removal_order = RemovalOrder.find(params[:id])
  end

  def edit
    @removal_order = RemovalOrder.find(params[:id])
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

  def update
    if @removal_order.update(removal_order_params)
      redirect_to @removal_order
      flash[:notice] = 'Pedido editado com sucesso!'
    else
      flash[:notice] = 'Você deve preencher todos os campos'
      render :edit
    end
  end

  def close
    @removal_order = RemovalOrder.find(params[:id])
    if @removal_order.close!
      redirect_to removal_orders_path
      flash[:notice] = 'Pedido encerrado com sucesso!'
    else
      flash[:notice] = 'Não foi possivel encerrado esse pedido'
    end
  end

  def destroy
    return unless @removal_order.destroy

    flash[:notice] = 'Pedido apagado com sucesso!'
    redirect_to removal_orders_path
  end

  private

  def set_parms
    @removal_order = RemovalOrder.find(params[:id])
  end

  def removal_order_params
    params.require(:removal_order).permit(:weight, :removal_date_start,
                                          :removal_date_end, :address)
  end
end
