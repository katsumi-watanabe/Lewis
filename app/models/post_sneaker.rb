class PostSneaker < ApplicationRecord
  belongs_to :user
  attachment :post_image

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :histories, dependent: :destroy

  # いいね順
  has_many :liked_users, through: :likes, source: :user
  # 性別選択
  enum gender_selection: { "Men's": 0, "Women's": 1 }

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
      all.order(created_at: :DESC)
    when 'likes'
      find(Like.group(:post_sneaker_id).order(Arel.sql('count(post_sneaker_id) desc')).pluck(:post_sneaker_id))
    end
  end

  # 閲覧履歴
  def browsing_history(user)
    new_history = histories.new
    new_history.user_id = user.id
    # 同じ投稿をcurrent_userが閲覧している場合、古い履歴を削除
    if user.histories.exists?(post_sneaker_id: id)
      sneaker_history = user.histories.find_by(post_sneaker_id: id)
      sneaker_history.destroy
    end
    new_history.save
  end

  # バリデーション設定
  validates :sneakers_name, presence: true, length: { maximum: 30 }
  validates :post_image, presence: { message: 'を選択してください' }
  validates :gender_selection, presence: { message: 'を選択してください' }
  validates :caption, length: { minimum: 1, maximum: 90 }
end
