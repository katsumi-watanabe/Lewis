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
    @user.update(admin_user_params)
    redirect_to user_detail_path(@user)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private

  def admin_user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
