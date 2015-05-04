class RenameStreamColumnsUniversal < ActiveRecord::Migration
  def change
  	rename_column :follows, :stream_id, :blog_id
  	rename_column :follows, :stream_user_id, :blog_owner_id

  	rename_column :posts, :stream_id, :blog_id
  end
end
