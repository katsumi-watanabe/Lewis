class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy

  enum solution_status: { "未解決": 0, "解決": 1, }
end
