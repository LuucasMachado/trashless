class GarbageMensController < ApplicationController
  before_action :authenticate_cooperative!
  def new
    @garbageman = GarbageMen.new
  end

  def show
    @garbageman = GarbageMen.find(params[:id])
  end

  def create
    @garbageman = GarbageMen.new(garbageman_params)
    @garbageman.cooperative = current_cooperative
    if @garbageman.save
      flash[:notice] = 'Coletador criado com sucesso'
      redirect_to garbage_men_url(@garbageman)
    else
      flash[:notice] = 'Não foi possível criar o coletador'
      render :new
    end
  end

  private

  def garbageman_params
    params.require(:garbage_men).permit(:name,
                                        :address,
                                        :contact,
                                        :withdrawal,
                                        :cooperative_id)
  end
end
