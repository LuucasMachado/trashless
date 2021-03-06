class RemovalOrdersController < ApplicationController
  before_action :set_params, only: [:show,
                                    :update,
                                    :destroy,
                                    :edit,
                                    :close,
                                    :close_coop,
                                    :accept]
  before_action :authenticate_user!, only: [:new,
                                            :finished,
                                            :create,
                                            :update]

  def index
    if params[:status].nil?
      @removal_orders = RemovalOrder.all
      @removal_orders = current_user.removal_orders.open if user_signed_in?
    else
      @removal_orders = RemovalOrder.where(status: params[:status])
    end
  end

  def finished
    @removal_orders = current_user.removal_orders.close
  end

  def new
    @removal_order = RemovalOrder.new
  end

  def show
    @removal_order = RemovalOrder.find(params[:id])
    @removal_order_problems = @removal_order.removal_order_problems
    @removal_order_problem = RemovalOrderProblem.new
  end

  def create
    @removal_order = RemovalOrder.new(removal_order_params)
    @removal_order.user = current_user
    if @removal_order.save
      flash[:notice] = 'Pedido de remoção criado com sucesso'
      redirect_to @removal_order
    else
      flash[:alert] = 'Não foi possível salvar o pedido de remoçāo'
      render :new
    end
  end

  def edit; end

  def update
    if @removal_order.update(removal_order_params)
      redirect_to @removal_order
      flash[:notice] = 'Pedido editado com sucesso!'
    else
      flash[:alert] = 'Você deve preencher todos os campos'
      render :edit
    end
  end

  def close
    if @removal_order.close!
      redirect_to removal_orders_path
      flash[:notice] = 'Pedido encerrado com sucesso!'
    else
      flash[:alert] = 'Não foi possivel encerrado esse pedido'
    end
  end

  def close_coop
    if @removal_order.garbage_man_id.nil?
      flash[:alert] = 'Não foi possivel encerrado esse pedido'
    else
      if @removal_order.close!
        flash[:notice] = 'Pedido encerrado com sucesso!'
      else
        flash[:alert] = 'Não foi possivel encerrado esse pedido'
      end
      redirect_to removal_order_path
    end
  end

  def destroy
    return unless @removal_order.destroy

    flash[:notice] = 'Pedido apagado com sucesso!'
    redirect_to removal_orders_path
  end

  def accept
    @removal_order.garbage_man = GarbageMan.find_by(id: params[:garbage_man])

    if @removal_order.save(context: :accept_removal_order)
      @removal_order.in_progress!
      flash[:notice] = 'Pedido aceito'
      return redirect_to @removal_order
    end

    flash[:error] = 'ha algo errado'
    @removal_order_problems = @removal_order.removal_order_problems
    @removal_order_problem = RemovalOrderProblem.new
    render :show
  end

  private

  def set_params
    @removal_order = RemovalOrder.find(params[:id])
  end

  def removal_order_params
    params.require(:removal_order).permit(:weight, :removal_date_start,
                                          :removal_date_end,
                                          :address,
                                          :description,
                                          :photo)
  end
end
