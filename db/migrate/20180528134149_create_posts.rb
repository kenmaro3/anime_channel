class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :comment
      t.integer :laugh
      t.integer :touch
      t.integer :excit
      t.integer :graphic
      t.integer :plot
      t.integer :recommend
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
