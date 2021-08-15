class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  # # guestログイン
  # def ensure_normal_user
  #   if resource.email == 'guest@example.com'
  #     redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
  #   end
  # end

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
