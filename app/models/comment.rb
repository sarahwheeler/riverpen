class Comment < ActiveRecord::Base

	# OWNED BY 
	belongs_to :user
	belongs_to :post

end
