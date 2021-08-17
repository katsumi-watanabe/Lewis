class User::ActivitiesController < ApplicationController
  #before_action :require_login, only: %i[read]

  def index
    @activities = Activity.where(user_id: current_user.id)
  end

  def read
    activity = Activity.find(params[:id])
    activity.read! if activity.unread?
    redirect_to activity.redirect_path
  end


end
