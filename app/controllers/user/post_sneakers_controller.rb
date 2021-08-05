class User::PostSneakersController < ApplicationController

  def new
    @post_sneaker = PostSneaker.new
  end

  def index
    @post_sneakers = PostSneaker.all
  end

  def show
  end

  def create
    @post_sneaker = PostSneaker.new(post_sneaker_params)
    @post_sneaker.user_id = current_user.id
    @post_sneaker.save
    redirect_to post_sneakers_path
  end

  def edit
  end

  def update
  end

  def delete
  end

   private

  def post_sneaker_params
    params.require(:post_sneaker).permit(:sneakers_name, :gender_selection, :post_image, :caption)
  end

end
