class PostCommentsController < ApplicationController
    # コメント投稿機能
    def create
        # 投稿画像のID（PostImageモデルのID）用のローカル変数
        post_image = PostImage.find(params[:post_image_id])
        
        # まだuser_idカラムとpost_image_idカラムが未記入
        # saveする前にカラムを埋める必要がある
        
        # ログイン中ユーザーに限定した記入済みのコメントモデル
        # comment = PostComment.new(post_comment_params)
        # コメントuser_idカラム＝ログイン中のIDを入れる
        # comment.user_id = current_user.id
        # これらを省略すると下記の通り
        comment = current_user.post_comments.new(post_comment_params)
        # コメントpost_image_idカラム＝PostImageモデルのIDを入れる
        comment.post_image_id = post_image.id
        comment.save
        # パスにはローカル変数（PostImageモデルのID）が入る
        redirect_to post_image_path(post_image)
    end
    
    def destroy
        # 投稿ID＝ユーザIDの時のみこのアクションに来る
        PostComment.find(params[:id]).destroy
        # ID＝PostCommentのID
        redirect_to post_image_path(params[:post_image_id])
        # 投稿画像のID（PostImageモデルのID）のほうに飛ぶ
    end
    
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end
end