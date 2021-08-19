class Chat < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :chat_room

  # ポリモーフィック(通知機能)
  has_one :activity, as: :subject, dependent: :destroy

  after_create_commit :create_activities

  private

  def create_activities
    if is_admin_send == true
      Activity.create(subject: self, user: self.chat_room.user, action_type: :chated)
    else
      Activity.create(subject: self, user: self.chat_room.user, action_type: :chated_admin)
    end
  end

end