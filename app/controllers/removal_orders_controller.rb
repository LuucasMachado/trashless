class RemovalOrdersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_parms, only: [:show, :update, :destroy]
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

  def destroy
    return unless @removal_order.destroy

    flash[:notice] = 'Pedido apagado com sucesso!'
    redirect_to removal_orders_path
  end

  def accept
    @removal_order = RemovalOrder.find(params[:id])
    @garbage_man = GarbageMan.find(params[:garbage_man])
    @removal_order.garbage_man = @garbage_man
    @removal_order.save!
    @removal_order.in_progress!
    

    flash[:notice] = 'Pedido aceito'
    redirect_to @removal_order
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
