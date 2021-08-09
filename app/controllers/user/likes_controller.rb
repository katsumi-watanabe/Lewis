class User::LikesController < ApplicationController

  def create
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @like = current_user.likes.new(post_sneaker_id: @post_sneaker.id)
    @like.save
    redirect_to post_sneaker_path(@post_sneaker)
  end

  def destroy
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @like = current_user.likes.find_by(post_sneaker_id: @post_sneaker.id)
    @like.destroy
    redirect_to post_sneaker_path(@post_sneaker)
  end

end
