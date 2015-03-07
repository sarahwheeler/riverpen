module FollowsHelper

	def follow_button_helper(stream)
		if current_user.is_following?(stream)
			render :partial => 'follows/following'
		else
			render :partial => 'follows/form'
		end
	end


end
