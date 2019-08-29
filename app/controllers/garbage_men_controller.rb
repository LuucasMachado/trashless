class GarbageMenController < ApplicationController
  before_action :authenticate_cooperative!
  def new
    @garbageman = GarbageMan.new
  end

  def show
    @garbageman = GarbageMan.find(params[:id])
  end

  def index
    @garbageman = GarbageMan.all
  end

  def close 
    @garbageman = GarbageMan.find(params[:id])
    @garbageman.status = :disabled
    if @garbageman.save
      flash[:notice] = 'Coletador desativado com sucesso'
      redirect_to garbage_men_path(@garbageman)
    else
      flash[:alert] = 'Não foi possivel desativar esse coletador'
    end
  end

  def create
    @garbageman = GarbageMan.new(garbageman_params)
    @garbageman.cooperative = current_cooperative
    if @garbageman.save
      flash[:notice] = 'Coletador criado com sucesso'
      redirect_to garbage_man_path(@garbageman)
    else
      flash[:alert] = 'Não foi possível criar o coletador'
      render :new
    end
  end

  private

  def garbageman_params
    params.require(:garbage_man).permit(:name,
                                        :address,
                                        :contact,
                                        :withdrawal,
                                        :cooperative_id)
  end
end
