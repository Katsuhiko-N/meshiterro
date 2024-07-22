class PostComment < ApplicationRecord
    
    # 各モデルとの関連付け
    belongs_to :user
    belongs_to :post_image
    
end
