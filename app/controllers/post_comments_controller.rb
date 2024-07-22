class PostCommentsController < ApplicationController
    # コメント投稿機能
    def create
        post_image = PostImage.find(params[:post_image_id])
        
        # 以下の文を省略
        # ログイン中ユーザーに限定したコメント入れる用のモデル作成
        # comment = PostComment.new(post_comment_params)
        # comment.user_id = current_user.id
        comment = current_user.post_comments.new(post_comment_params)
        comment.save
        redirect_to post_image_path
    end
    
    # 投稿ページ
    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new
    end
        
    
    
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end
    
end
