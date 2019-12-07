class GoodEvaluationsController < ApplicationController
  before_action :set_user

  def new
    GoodEvaluation.new
  end

  def create
    @good_evaluation = @user.good_evaluations.new(good_evaluation_params)
    if @good_evaluation.save
      render_to root_path
    else
      render_to root_path
    end
  end

  private
  def good_evaluation_params
    params.require(:good_evaluation).permit(:user_id).merge(evaluate_user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
