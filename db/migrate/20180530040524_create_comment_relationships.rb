class CreateCommentRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_relationships do |t|
      t.references :comment, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
