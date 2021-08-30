class User::HomesController < ApplicationController
  def top
    @post_sneakers = PostSneaker.includes(:liked_users).sort { |a, b| b.liked_users.size <=> a.liked_users.size }.first(6)
  end

  # Total, Men's, Women's絞り込み
  def search
    @post_sneakers = PostSneaker.search(params[:keyword]).includes(:likes).sort { |a, b| b.likes.size <=> a.likes.size }.first(6)
    @keyword = params[:keyword]
    render :top
  end
end
