class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @count = Count.new
    @counts = Count.where(group_id: params[:group_id], user_id: current_user.id).order(updated_at: 'desc').limit(1)
    @score = Score.new
    @scores = Score.where(group_id: params[:group_id], user_id: current_user.id).order(updated_at: 'desc').limit(1)
    @user = User.find(@group.user_id)
  end

  def new
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @count = Count.new
    @counts = Count.where(group_id: params[:group_id], user_id: current_user.id).order(updated_at: 'desc').limit(1)
    @score = Score.new
    @scores = Score.where(group_id: params[:group_id], user_id: current_user.id).order(updated_at: 'desc').limit(1)
    @user = User.find(@group.user_id)
  end

  def create
    @message = @group.messages.create(message_params)
    respond_to do |format|
      format.html { redirect_to group_messages_path(@group), notice: 'メッセージが送信されました' }
      format.json
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
