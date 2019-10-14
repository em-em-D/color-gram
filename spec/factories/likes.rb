# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    for_post

    trait :for_post do
      association(:like, factory: :post)
    end
    association :user
  end
end
