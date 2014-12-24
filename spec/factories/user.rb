FactoryGirl.define do
  factory :user do
    email { |u| "#{u.name.gsub(' ', '')}@riverpen.com" }
    password 'password'
    password_confirmation { |u| u.password }
	end
end