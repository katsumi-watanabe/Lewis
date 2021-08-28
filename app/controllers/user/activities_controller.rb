class User::ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.page(params[:page]).where(user_id: current_user.id, activity_status: "user_activity").order(created_at: :DESC)
  end

  def read
    activity = Activity.find(params[:id])
    activity.read! if activity.unread?
    redirect_to activity.redirect_path
  end
end
