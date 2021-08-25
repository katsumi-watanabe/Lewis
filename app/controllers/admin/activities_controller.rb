class Admin::ActivitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
   @activities = Activity.page(params[:page]).reverse_order.where(activity_status: "admin_activity").order(created_at: :DESC)
  end

  def read
    activity = Activity.find(params[:id])
    activity.read! if activity.unread?
    redirect_to activity.redirect_path
  end
end
