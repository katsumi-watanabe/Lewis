class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # chat
  has_many :chats, dependent: :destroy

  # admin側ゲスト会員
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
      admin.id = 2
    end
  end
end
