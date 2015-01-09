require 'factory_girl_rails'


FactoryGirl.define do
	factory :user do  |u|
		sequence(:username) { |n| "wonderwoman#{n}" }
    email { |u| "#{u.username}@themyscira.gov" }
    password "password"
    password_confirmation { |u| "#{u.password}" }
	end
end