class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_profile

  # OWNERSHIP
  has_one :profile, dependent: :destroy

  has_many :blogs
  has_many :follows
  has_many :posts, through: :blogs  

  #  COLUMNS 
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, 
  					:uniqueness => {
					    :case_sensitive => false
					  }
  

  # For Devise: Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login


	def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    where(conditions).first
	  end
	end

  def build_profile
    Profile.create(user_id: self.id)
  end

  def is_following?(blog)
    self.follows.where(blog_id: blog).empty? 
  end
end
