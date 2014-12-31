require 'factory_girl'

FactoryGirl.define :user do |user|
  user.email                 { "wonderwoman@themyscira.gov"}
  user.password              { "grrlpower"   }
  user.password_confirmation { "grrlpower"   }
end