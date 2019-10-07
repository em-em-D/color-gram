# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    description { Faker::Games::WorldOfWarcraft.quote }
    association :user, factory: :user
  end
end
