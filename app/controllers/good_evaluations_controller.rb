class GoodEvaluationsController < ApplicationController
  before_action :set_user

  def new
    GoodEvaluation.new
  end

  def create
    @good_evaluation = @user.good_evaluations.new(good_evaluation_params)
    @date = GoodEvaluation.where(user_id: @user.id, evaluate_id: current_user.id).last
    if @date == nil
      @date = 1
    else
      @date = @date.created_at.strftime('%Y/%m/%d')
    end
    @good_evaluation.save unless @date == Date.today.to_time.strftime('%Y/%m/%d')
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
