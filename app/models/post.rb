class Post < ApplicationRecord
	belongs_to :user
	
	validates :user_id, presence: true
	validates :title,   presence: true
	validates :comment, presence: true, length: {maximum:255}
	
	has_many :likes
	has_many :favorited, through: :likes, source: :user
	
	has_many :comment_relationships
	has_many :mentioned, through: :comment_relationships, source: :comment
	
	
	
end

