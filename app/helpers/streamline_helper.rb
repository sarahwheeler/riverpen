module StreamlineHelper

	def streamed_list
		# refactor into model methods
		@post_ids = []
		if @user.follows.any?
			@user.follows.each do |f|
				post_collection = []
				stream = Stream.find(f.stream_id)
				stream.posts.order('created_at').each do |p| do 					
					post_collection << p.id 
				end
				@post_ids << post_collection
			end
		end
	end

	# take @post_ids, sort and display them

end
