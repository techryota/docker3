class CountsController < ApplicationController
  before_action :set_group

  def index
    @count = Count.new
    @counts = @group.counts.includes(:user)
  end

  def create
    @count = @group.counts.new(count_params)
    if @count.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @counts = @group.counts.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def count_params
    params.require(:count).permit(:ball1, :ball2, :ball3, :ball4, :strike1, :strike2, :strike3, :auto1, :auto2, :auto3, :report).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
