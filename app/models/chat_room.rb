class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy

  enum solution_status: { "未解決": 0, "解決": 1, }

  after_update_commit :update_activities

  private

  def update_activities
    Activity.create(subject: self, user: self.user, action_type: :solutioned_status, activity_status: :admin_activity)
  end

end
