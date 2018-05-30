class CommentRelationship < ApplicationRecord
  belongs_to :comment
  belongs_to :post
  
  validates :comment_id, presence: true
  validates :post_id, presence: true
end
