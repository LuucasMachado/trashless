class GarbageMenController < ApplicationController
  before_action :authenticate_cooperative!
  
  def new
    @garbageman = GarbageMan.new
  end

  def show
    @garbageman = GarbageMan.find(params[:id])
  end

  def create
    @garbageman = GarbageMan.new(garbageman_params)
    @garbageman.cooperative = current_cooperative
    if @garbageman.save
      flash[:notice] = 'Coletador criado com sucesso'
      redirect_to garbage_man_path(@garbageman)
    else
      flash[:notice] = 'Não foi possível criar o coletador'
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
