class PostImage < ApplicationRecord
    
    has_one_attached :image
    
    # 各モデルとの関連付け
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    # バリデーション
    # shop_nameが存在しているか
    validates :shop_name, presence: true
    #imageが存在しているか 
    validates :image, presence: true
    
    
    
    # プロフィール画像表示メソッド定義
    def get_image
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
        end
        image
    end
    
    def favorited_by?(user)
        # ユーザIDがいいねしたユーザIDのリストと一致するか
        favorites.exists?(user_id: user.id)
    end
    
end
