FactoryGirl.define do
  factory :employee do
    email { FFaker::Internet.email }
    password { 'password' }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    department { Department.all.sample }
  end
end
