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

  def create
    @removal_order = RemovalOrder.new(removal_order_params)
    if @removal_order.save
      flash[:notice] = 'Pedido de remoção criado com sucesso'
      redirect_to @removal_order
    else
      flash[:notice] = 'Não foi possível salvar o pedido de remoçāo'
      render :new

  def update
    if @removal_order.update(removal_order_params)
      redirect_to @removal_order
      flash[:success] = 'Pedido editado com sucesso!'
    else
      flash[:error] = 'Você deve preencher todos os campos'
      render :edit
    end
  end

  def destroy
    if @removal_order.destroy
      flash[:success] = 'Pedido apagado com sucesso!'
      redirect_to removal_orders_path
    end
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
