class Activity < ApplicationRecord

  # ポリモーフィック(通知機能)
  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_post: 0, liked_to_own_post: 1, followed_me: 2, chated: 3, chated_admin: 4, solutioned_status: 5 }
  include Rails.application.routes.url_helpers
  # 既読/未読
  enum read: { unread: false, read: true }

  def redirect_path
    case action_type.to_sym
    when :commented_to_own_post
      post_sneaker_path(subject.post_sneaker, anchor: "comment-#{subject.id}")
    when :liked_to_own_post
      post_sneaker_path(subject.post_sneaker)
    when :followed_me
      user_detail_path(subject.follower)
    when :chated
      chat_path(subject.chat_room)
    when :chated_admin
      admin_chat_path(subject.chat_room)
    when :solutioned_status
      admin_chat_path(subject.chat_room)
    end
  end
end
