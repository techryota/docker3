class GoodEvaluationsController < ApplicationController
  before_action :set_user

  def new
    GoodEvaluation.new
  end

  def create
    @good_evaluation = @user.good_evaluations.new(good_evaluation_params)
    @good_evaluation.save
    redirect_to root_path
  end

  private
  def good_evaluation_params
    params.require(:good_evaluation).permit(:good).merge(user_id: params[:user_id], evaluate_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
