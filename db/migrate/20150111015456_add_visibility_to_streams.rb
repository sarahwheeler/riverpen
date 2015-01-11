class AddVisibilityToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :visibility, :string
  end
end
