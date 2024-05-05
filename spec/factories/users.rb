# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password' }
      confirmed_at {Time.zone.now} #skip confirmation
      # Add other attributes as needed
    end
  end
  