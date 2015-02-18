module HomeHelper

	def random_background
		backgrounds = ["/assets/laptop_boat.jpg", "/assets/couch_dog.jpg", "/assets/coffee_station.jpg" ]
		backgrounds.sample
	end

end
