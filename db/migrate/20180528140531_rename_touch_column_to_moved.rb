class RenameTouchColumnToMoved < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts , :touch, :moved
  end
end
