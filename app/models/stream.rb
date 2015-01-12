class Stream < ActiveRecord::Base
	
	belongs_to :user

	# OWNERSHIP
	has_many :posts

	validates :user_id, presence: true
	validates :category, presence: true
	validates :public, presence: true

end
