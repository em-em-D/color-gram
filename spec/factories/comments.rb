# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Games::WorldOfWarcraft.quote }
  end
end
