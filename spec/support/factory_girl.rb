require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    name 'Rockstar Mary'
    password 'password'
    password_confirmation 'password'
  end

  factory :group do
    name "This Awesome Group"
    description "We're the best!"
  end

end
