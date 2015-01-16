class Stream < ActiveRecord::Base

	before_save :capitalize_category

	belongs_to :user

	# OWNERSHIP
	has_many :posts
	has_many :subcategories

	# VALIDATIONS

	validates :user_id, presence: true
	validates :category, presence: true
	validates :public, presence: true

	def capitalize_category
  	self.category.capitalize!
	end

end
