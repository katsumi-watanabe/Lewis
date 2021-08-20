class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_sneaker

  # ポリモーフィック(通知機能)
  has_one :activity, as: :subject, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    unless self.post_sneaker.user.id == user.id
      Activity.create(subject: self, user: self.post_sneaker.user, action_type: :commented_to_own_post, activity_status: :user_activity)
    end
  end

end
