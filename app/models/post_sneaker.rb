class PostSneaker < ApplicationRecord
  belongs_to :user
  attachment :post_image

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # いいね順
  has_many :liked_users, through: :likes, source: :user
  # 性別選択
  enum gender_selection: { "Men's": 0, "Women's": 1, }

  # 性別検索機能
  def self.search(keyword)
    where(["gender_selection like?", "%#{keyword}%"])
  end

  # いいね機能
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # いいね順、新着順
  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'likes'
      return find(Like.group(:post_sneaker_id).order(Arel.sql('count(post_sneaker_id) desc')).pluck(:post_sneaker_id))
    end
  end

  validates :sneakers_name, presence: true, length: { maximum: 30 }
  validates :post_image, presence: true
  validates :gender_selection, presence: true
  validates :caption, length: { minimum: 1, maximum: 150 }


end
