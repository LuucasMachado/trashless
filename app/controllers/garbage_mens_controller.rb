class GarbageMensController < ApplicationController
  def new
    @garbageman = GarbageMen.new
  end

  def show
    @garbageman = GarbageMen.find(params[:id])
  end

  def current_user
    @current_user ||= Cooperative.find_by(id: session[:user_id])
  end

  def create
    @garbageman = GarbageMen.new(garbageman_params)
    @garbageman.cooperative_id = @current_user
    if @garbageman.save
      flash[:notice] = 'Coletador criado com sucesso'
      redirect_to @garbageman
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