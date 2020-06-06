FactoryGirl.define do
  factory :employee do
    sequence(:email) { |n| "test-#{"%03i" % rand(0...1_000)}-#{"%03i" % rand(0...1_000)}-#{n}@dg.com" }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
