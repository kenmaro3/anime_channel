class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts
  
  has_many :comments
  
  has_many :likes
  has_many :favorites, through: :likes, source: :post
  
  
  def favorite(other_post)
    unless self.id == other_post.user_id
      self.likes.find_or_create_by(post_id: other_post.id)
    end
    
  end
  
  def unfavorite(other_post)
    like = self.likes.find_by(post_id: other_post.id)
    like.destroy if like
  end
  
  def favorite?(other_post)
    self.favorites.include?(other_post)
  end  
end
