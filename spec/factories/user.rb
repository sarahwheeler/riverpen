require 'factory_girl_rails'


FactoryGirl.define do
	factory :user do  |u|
		sequence(:username) { |n| "wonderwoman#{n}" }
    email { |u| "#{u.username.gsub(' ', '')}@themyscira.gov" }
    password 'grrlpower'
    password_confirmation { |u| u.password }
	end
end