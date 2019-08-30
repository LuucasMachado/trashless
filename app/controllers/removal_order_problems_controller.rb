class RemovalOrderProblemsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_removal_order, only: [:create]

  def create
    @removal_order_problem = @removal_order.removal_order_problems
                                           .create(removal_order_problem_params)
    @removal_order_problem.user = current_user
    if @removal_order_problem.save
      @removal_order_problems = @removal_order.removal_order_problems
      respond_with(&:js)
    else
      head 400
    end
  end

  private

  def find_removal_order
    @removal_order = RemovalOrder.find(params[:removal_order_id])
  end

  def removal_order_problem_params
    params.require(:removal_order_problem).permit(:comment)
  end
end