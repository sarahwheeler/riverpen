module ApplicationHelper

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def user_stream_options
    unless current_user.nil?
  	 Stream.where(:user_id => current_user.id).map{ |s| [ s.category.capitalize, s.id ] }
    end
  end

end
