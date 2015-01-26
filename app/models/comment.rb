class Comment < ActiveRecord::Base

	# OWNED BY 
	belongs_to :user
	belongs_to :post

	# VALIDATIONS
	validates :user_id, presence: true
	validates :post_id, presence: true
	validates :content, presence: true


	def owner(user_id)
  	owner = User.find(user_id)
  	return owner.username
  end

end
