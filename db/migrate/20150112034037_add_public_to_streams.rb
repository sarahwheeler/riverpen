class AddPublicToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :public, :boolean
    remove_column :streams, :visibility
  end
end
