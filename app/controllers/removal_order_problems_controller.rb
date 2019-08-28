class RemovalOrderProblemsController < ApplicationController
  def create
    @removal_order = RemovalOrder.find(params[:removal_order_id])
    @removal_order_problem = @removal_order.removal_order_problems
      .create(removal_order_problem_params)
    @removal_order_problem.user = current_user
    @removal_order_problem.save

    @removal_order_problems = @removal_order_problem.removal_order
      .removal_order_problems

    respond_with do |format|
      format.js
    end
  end

  private

  def removal_order_problem_params
    params.require(:removal_order_problem).permit(:comment)
  end
end
