class Favorite < ApplicationRecord
    
    # 各モデルとの関連付け
    belongs_to :user
    belongs_to :post_image
    
    validates :user_id, uniqness: {scope: :post_image_id}
    
end
