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
    if @post_sneaker.save
      flash[:notice] = "投稿が成功しました"
      redirect_to post_sneakers_path
    else
      flash[:notice] = "投稿が失敗しました"
      render :new
    end
  end

  def edit
    @post_sneaker = PostSneaker.find(params[:id])
  end

  def update
    @post_sneaker = PostSneaker.find(params[:id])
    @post_sneaker.user_id = current_user.id
    if @post_sneaker.update(post_sneaker_params)
      flash[:notice] = "編集が成功しました"
      redirect_to post_sneaker_path
    else
      flash[:notice] = "編集が失敗しました"
      render :edit
    end
  end

  def destroy
    @post_sneaker = PostSneaker.find(params[:id])
    @post_sneaker.user_id = current_user.id
    if @post_sneaker.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to post_sneakers_path
    else
      flash[:notice] = "削除に失敗しました"
      render :show
    end
  end

  # Total, Men's, Women's絞り込み
  def search
    if params[:type] == "0"
      @post_sneakers = PostSneaker.search(params[:keyword])
      @keyword = params[:keyword]
      render :index
    elsif params[:type] == "new"
      selection = params[:type]
      @post_sneakers = PostSneaker.sort(selection)
      render :index
    elsif params[:type] == "likes"
      @post_sneakers = PostSneaker.includes(:likes).sort {|a,b|b.likes.size <=> a.likes.size}
      render :index
    elsif params[:type] == "1"
     @post_sneakers = PostSneaker.where(user_id: [current_user.id, *current_user.following_ids])
      render :index
    end
  end

   private

  def post_sneaker_params
    params.require(:post_sneaker).permit(:sneakers_name, :gender_selection, :post_image, :caption)
  end

end
