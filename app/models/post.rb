class Post < ActiveRecord::Base
	belongs_to :streams
	belongs_to :user

	has_many :comments

	default_scope -> { order(created_at: :desc) }

	validates :user_id, :presence => true
	validates :stream_id, :presence => true


  def self.owner
  	@owner = User.find(self.user_id)
  	return  @owner
  end
  

end
