class AddCommentToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :comment, :text
  end
end
