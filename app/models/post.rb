class Post < ActiveRecord::Base
	belongs_to :blogs
	belongs_to :user

	has_many :comments

	default_scope -> { order(created_at: :desc) }

	validates :user_id, :presence => true
	validates :blog_id, :presence => true


  def owned_by?(user)
  	@owner = User.find(self.user_id)
  	return  @owner
  end
  

end
