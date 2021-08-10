class PostSneaker < ApplicationRecord
  belongs_to :user
  attachment :post_image

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # いいね順
  has_many :liked_users, through: :likes, source: :user

  def self.search(keyword)
    where(["gender_selection like?", "%#{keyword}%"])
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :sneakers_name, presence: true, length: { maximum: 30 }
  validates :post_image, presence: true
  validates :gender_selection, presence: true
  validates :caption, length: { minimum: 1, maximum: 150 }

# 性別選択
  enum gender_selection: { "Men's": 0, "Women's": 1, "Kid's": 2 }
end
