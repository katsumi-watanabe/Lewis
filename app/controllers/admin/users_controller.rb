class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def search
    @users = User.search(params[:word]).page(params[:page])
    @word = params[:word]
    render :index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(admin_user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  private

  def admin_user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
