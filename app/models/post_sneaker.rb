class PostSneaker < ApplicationRecord
  belongs_to :user
  attachment :post_image

  validates :sneakers_name, presence: true, length: { maximum: 30 }
  validates :post_image, presence: true
  validates :gender_selection, presence: true
  validates :caption, length: { minimum: 1, maximum: 150 }

# 性別選択
  enum gender_selection: { mens: 0, womens: 1, kids: 2 }
end
