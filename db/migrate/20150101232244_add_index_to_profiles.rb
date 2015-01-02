class AddIndexToProfiles < ActiveRecord::Migration
  def change
  	add_index :profiles, [:user_id, :created_at]
  end
end
