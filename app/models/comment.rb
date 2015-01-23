class Comment < ActiveRecord::Base

	# OWNED BY 
	belongs_to :user
	belongs_to :post


	def self.owner(user_id)
  	owner = User.find_by_id(user_id)
  	return owner.username
  end

end
