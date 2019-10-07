# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'test123' }
  end
end
