# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password' }
      # Add other attributes as needed
    end
  end
  