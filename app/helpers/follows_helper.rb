module FollowsHelper

	def follow_button_helper(blog)
		if current_user.is_following?(blog)
			render :partial => 'follows/following'
		else
			render :partial => 'follows/form'
		end
	end


end
