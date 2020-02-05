class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]
  before_action :set_root, only: [:show]

  def edit
    
  end

  def show
    @good_evaluation = GoodEvaluation.new
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def set_root
    redirect_to root_path if @user.id == current_user.id
  end

  def set_user
    @user = User.find(params[:id])
    @good_count = GoodEvaluation.where(user_id: @user.id).count
  end
end
