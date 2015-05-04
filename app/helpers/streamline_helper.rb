module StreamlineHelper

	def streamed_list
		# refactor into model methods
		@all_posts = []
		if @user.follows.any?
			@user.follows.each do |f|
				post_collection = []
				blog = Blog.find(f.blog_id)
				blog.posts.order('created_at').each do |p| 					
					post_collection << p
				end
				@all_posts << post_collection
			end
		end
		@streamline = @all_posts.flatten  # incomplete


		
	end



end
