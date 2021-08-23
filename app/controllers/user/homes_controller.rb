class User::HomesController < ApplicationController

  def top
    @post_sneakers = PostSneaker.includes(:liked_users).limit(6).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

# Total, Men's, Women's絞り込み
  def search
    @post_sneakers = PostSneaker.search(params[:keyword]).limit(6).includes(:likes).sort {|a,b|b.likes.size <=> a.likes.size}
    @keyword = params[:keyword]
    render :top
  end

end
