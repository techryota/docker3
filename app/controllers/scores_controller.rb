class ScoresController < ApplicationController
  before_action :set_group

  def index
    @score = Score.new
    @scores = @group.scores.includes(:user)
  end

  def create
    @score = @group.scores.new(score_params)
    if @score.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @scores = @group.scores.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def score_params
    params.require(:score).permit(:first1, :second1, :first2, :second2, :first3, :second3, :first4, :second4, :first5, :second5, :first6, :second6, :first7, :second7, :first8, :second8, :first9, :second9, :first10, :second10, :first11, :second11, :first12, :second12, :first_hit, :second_hit, :first_error, :second_error, :first_team, :second_team).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
