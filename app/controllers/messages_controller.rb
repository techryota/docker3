class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :new]
  before_action :set_index, only: :index
  before_action :set_new, only: :new

  def index
    
  end

  def new

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
    @user = User.find(@group.user_id)
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @count = Count.new
    @counts = Count.where(group_id: params[:group_id], user_id: @user.id).order(updated_at: 'desc').limit(1)
    @score = Score.new
    @scores = Score.where(group_id: params[:group_id], user_id: @user.id).order(updated_at: 'desc').limit(1)
  end

  def set_index
    redirect_to new_group_message_path if @user.name == current_user.name
  end

  def set_new
    redirect_to group_messages_path unless @user.name == current_user.name
  end
end
