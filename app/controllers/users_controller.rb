class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @good_count = GoodEvaluation.where(user_id: @user.id).count
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
end
