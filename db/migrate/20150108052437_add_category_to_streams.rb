class AddCategoryToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :category, :string
    add_column :streams, :user_id, :string
    add_index :streams, :user_id
  end
end
