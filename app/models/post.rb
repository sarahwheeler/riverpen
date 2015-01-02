class Post < ActiveRecord::Base
	belongs_to :streams

	default_scope -> { order(created_at: :desc) }
end
