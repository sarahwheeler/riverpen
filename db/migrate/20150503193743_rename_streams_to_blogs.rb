class RenameStreamsToBlogs < ActiveRecord::Migration
  def change
    rename_table :streams, :blogs
  end 
end
