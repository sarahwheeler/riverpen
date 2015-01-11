class Post < ActiveRecord::Base
	belongs_to :streams
	belongs_to :user

	default_scope -> { order(created_at: :desc) }

	validates :user_id, :presence => true
	validates :stream_id, :presence => true
end
