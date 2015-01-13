class AddCategoryToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :category, :string
    add_column :streams, :user_id, :integer
    add_index :streams, :user_id
  end
end
