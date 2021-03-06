class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_sneaker

  # ポリモーフィック(通知機能)
  has_one :activity, as: :subject, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    unless post_sneaker.user_id == user.id
      Activity.create(subject: self, user: post_sneaker.user, action_type: :liked_to_own_post, activity_status: :user_activity)
    end
  end
end
