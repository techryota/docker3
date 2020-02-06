class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
      
    else
      render :new
    end
  end

  def show
    @url = request.path[8..]
    @groups = Group.where(date: @url)
    # @aaa = []
    # @groups.each do |group|
    #   @aaa << group.user.good_evaluations.count
    # end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :date).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
