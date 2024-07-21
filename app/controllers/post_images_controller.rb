class PostImagesController < ApplicationController
  # 投稿ページの表示
  def new
    @post_image = PostImage.new
  end
  
  # 投稿機能
  def create
    # モデルの枠に入力データ(ストロングパラメータ)が入っている
    @post_image = PostImage.new(post_image_params)
    # サインインしているユーザID＝投稿者Id
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_index_path
  end
  
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
  
  
end