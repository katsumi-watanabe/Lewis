class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  # ポリモーフィック(通知機能)
  has_one :activity, as: :subject, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    Activity.create(subject: self, user: followed, action_type: :followed_me, activity_status: :user_activity)
  end
end
