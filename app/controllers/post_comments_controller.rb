class PostCommentsController < ApplicationController
    # コメント投稿機能
    def create
        post_image = PostImage.find(params[:post_image_id])
        # ログイン中ユーザーに限定したコメント入れる用のモデル作成
        # comment = PostComment.new(post_comment_params)
        # コメントしたユーザーID＝ログイン中のID
        # comment.user_id = current_user.id
        # これらを省略すると下記の通り
        comment = current_user.post_comments.new(post_comment_params)
        # コメントされた投稿画像ID＝PostImageモデルのID
        comment.post_image_id = post_image.id
        comment.save
        redirect_to post_image_path(post_image)
    end
    
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end
    
end
