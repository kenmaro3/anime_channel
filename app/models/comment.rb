class Comment < ApplicationRecord
	belongs_to :user
	
	validates :content, presence: true, length: {maximum: 255}
	validates :user_id, presence: true
	
	has_many :comment_relationships
	has_many :mentions, through: :comment_relationships, source: :post
	
	def put_comment(post)
		self.comment_relationships.find_or_create_by(post_id: post.id)
	end
	
	def delete_comment(post)
		comment = self.comment_relationships.find_by(post_id: post.id)
		comment.destroy if comment
	end
	
end
