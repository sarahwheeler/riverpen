module HomeHelper

	def random_background
		backgrounds = ["/assets/laptop_boat.jpg", "/assets/couch_dog.jpg", "/assets/coffee_station.jpg" ]
		backgrounds.sample
	end

	def email_placeholder
		writers = ["VirginiaWoolf@wordsmith.com", "ToniMorrison@wordsmith.com",
				"MayaAngelou@wordsmith.com", "MargaretAtwood@wordsmith.com", 
				"AudreLorde@wordsmith.com"]
		writers.sample
	end

end
