class User::PostSneakersController < ApplicationController

  def new
    @post_sneaker = PostSneaker.new
  end

  def index
    @post_sneakers = PostSneaker.all
  end

  def show
    @post_sneaker = PostSneaker.find(params[:id])
    @user = @post_sneaker.user
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @post_sneaker = PostSneaker.new(post_sneaker_params)
    @post_sneaker.user_id = current_user.id
    @post_sneaker.save
    redirect_to post_sneakers_path
  end

  def edit
    @post_sneaker = PostSneaker.find(params[:id])
  end

  def update
    @post_sneaker = PostSneaker.find(params[:id])
    @post_sneaker.user_id = current_user.id
    @post_sneaker.update(post_sneaker_params)
    redirect_to post_sneaker_path
  end

  def destroy
    @post_sneaker = PostSneaker.find(params[:id])
    @post_sneaker.user_id = current_user.id
    @post_sneaker.destroy
    redirect_to post_sneakers_path
  end

  # Total, Men's, Women's, Kid's絞り込み
  def search
    if params[:type].to_i == 0
      @post_sneakers = PostSneaker.search(params[:keyword])
      @keyword = params[:keyword]
      render :index
    elsif params[:type].to_s == new
      selection = params[:type]
      @post_sneakers = PostSneaker.sort(selection)
      render :index
    elsif params[:type].to_s == likes
      selection = params[:type]
      @post_sneakers = PostSneaker.sort(selection)
      render :index
    end
  end

   private

  def post_sneaker_params
    params.require(:post_sneaker).permit(:sneakers_name, :gender_selection, :post_image, :caption)
  end

end
