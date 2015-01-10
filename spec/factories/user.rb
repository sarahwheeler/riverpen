require 'factory_girl_rails'

FactoryGirl.define do
	factory :user do 
		username "wonderwoman" 
    email "wonderwoman@themyscira.gov" 
    password "password"
    password_confirmation "password"
	end
end