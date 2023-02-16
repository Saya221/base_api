# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "user#{Time.current}@gmail.com" }
    role { rand(0..2) }
    age { rand(10..50) }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
