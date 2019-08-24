class CollectorsController < ApplicationController
  def new
    @collector = Collector.new
  end

  def create
    @collector = Collector.new(removal_order_params)
    if @collector.save
      flash[:notice] = 'Coletador criado com sucesso'
      redirect_to @collector
    else
      flash[:notice] = 'Não foi possível salvar o pedido de remoçāo'
      render :new
    end
  end

  private

  def collector_params
    params.require(:collector).permit(:name,
                                          :address,
                                          :contact,
                                          :withdrawal)
  end

end