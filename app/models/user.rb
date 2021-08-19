class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_sneakers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # いいね順
  has_many :liked_posts, through: :likes, source: :post
  # chat
  has_many :chats, dependent: :destroy
  has_one :chat_room, dependent: :destroy


  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  attachment :profile_image

  validates :name, presence: true, length: { maximum: 30 }
  validates :introduction, length: { maximum: 50 }

  # follow/unfollow
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # guestログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.id = 2
      user.name = "ゲスト会員"
      user.introduction = "ゲストアカウント（会員）です。"
    end
  end

  # 退会フラグ
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
