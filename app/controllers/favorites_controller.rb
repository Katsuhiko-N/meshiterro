class FavoritesController < ApplicationController
    
    def create
        # 投稿画像のID（PostImageモデルのID）用のローカル変数
        post_image = PostImage.find(params[:post_image_id])
        # まだuser_idカラムとpost_image_idカラムが未記入
        # saveする前にカラムを埋める必要がある
        
        # ログイン中ユーザーに限定した「空欄」のfavoriteモデル
        # Favoriteモデルpost_image_idカラム＝PostImageモデルのIDを入れる
        # favorite = PostComment.new(post_image_id: post_image.id)
        # user_idカラム＝ログイン中のIDを入れる
        # comment.user_id = current_user.id
        # これらを省略すると下記の通り
        favorite = current_user.favorites.new(post_image_id: post_image.id)
        favorite.save
        # パスにはローカル変数（PostImageモデルのID）が入る
        redirect_to post_image_path(post_image)
    end
    
    def destroy
        # 投稿画像のID（PostImageモデルのID）用のローカル変数
        post_image = PostImage.find(params[:post_image_id])
        
        # post_image_idカラムから対応するものを見つける
        favorite = current_user.favorites.find_by(post_image_id: post_image.id)
        favorite.destroy
        # パスにはローカル変数（PostImageモデルのID）が入る
        redirect_to post_image_path(post_image)
    end
end