class Stream < ActiveRecord::Base
	
	belongs_to :user

	# OWNERSHIP
	has_many :posts
end
