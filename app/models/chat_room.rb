class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy

  enum solution_status: { "未解決": 0, "解決": 1, }

  # ポリモーフィック(通知機能)
  # has_one :activity, as: :subject, dependent: :destroy

  # after_create_commit :create_activities

  # private

  # def create_activities
  #   Activity.create(subject: self, user: self.chat_room.user, action_type: :solutioned_status)
  # end
end
