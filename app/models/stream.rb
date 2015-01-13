class Stream < ActiveRecord::Base
	
	belongs_to :user

	# OWNERSHIP
	has_many :posts
	has_many :subcategories

	validates :user_id, presence: true
	validates :category, presence: true
	validates :public, presence: true

end
