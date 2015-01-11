class AddTitleToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :type, :string
  	add_column :posts, :title, :string
  	add_column :posts, :content, :text
  	add_column :posts, :user_id, :integer
  	add_column :posts, :stream_id, :integer
  end
end
