class PostSneaker < ApplicationRecord
  belongs_to :user
  attachment :post_sneakers_image
end
