# frozen_string_literal: true

class User::Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to post_sneakers_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false)
        flash[:alert] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:alert] = "必須項目を入力してください。"
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
