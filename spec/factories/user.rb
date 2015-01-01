require 'factory_girl_rails'


FactoryGirl.define do
	factory :wonderwoman do |user|
	  user.email                 	{ "wonderwoman@themyscira.gov" }
	  user.username							 	{ "wonderwoman" }
	  user.password              	{ "grrlpower"  }
	  user.password_confirmation 	{ "grrlpower"  }
	end
end