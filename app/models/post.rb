class Post < ActiveRecord::Base
	belongs_to :streams
	belongs_to :user

	default_scope -> { order(created_at: :desc) }
end
