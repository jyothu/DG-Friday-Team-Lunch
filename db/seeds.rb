if Rails.env.development?
  AdminUser.create!(
    email: 'admin@dg.com',
    password: 'password',
    password_confirmation: 'password',
  )

  ['HR', 'IT Operations', 'Engineering', 'IT Help Desk', 'DevOps'].each do |department|
    Department.find_or_create_by!(name: department)
  end

  FactoryGirl.create_list(:employee, 100)
end