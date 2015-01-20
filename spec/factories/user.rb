require 'factory_girl_rails'

FactoryGirl.define do
	factory :user do 
		sequence(:username) { |n| "wonderwoman8#{n}" }
		sequence(:email) { |n| "wonderwoman#{n}@themyscira.gov" }
    password "password"
    password_confirmation "password"
  end
end