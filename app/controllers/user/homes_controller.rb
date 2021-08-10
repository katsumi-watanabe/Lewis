class User::HomesController < ApplicationController

  def top
    @post_sneakers = PostSneaker.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end

# Total, Men's, Women's, Kid's絞り込み
  def search
    @post_sneakers = PostSneaker.search(params[:keyword])
    @keyword = params[:keyword]
    render :top
  end

end
