class User::DetailsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_sneakers = PostSneaker.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to user_detail_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
