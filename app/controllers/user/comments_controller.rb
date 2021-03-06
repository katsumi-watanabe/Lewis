class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_sneaker_id = @post_sneaker.id
    @comment.save
    @new_comment = Comment.new
  end

  def edit
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @comment = Comment.find(params[:id])
    @comment.user_id = current_user.id
    @comment.update(comment_params)
    @new_comment = Comment.new
  end

  def destroy
    @post_sneaker = PostSneaker.find(params[:post_sneaker_id])
    @comment = Comment.find(params[:id])
    Comment.find_by(id: params[:id], post_sneaker_id: params[:post_sneaker_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
