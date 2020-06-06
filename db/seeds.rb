AdminUser.find_or_create_by!(
  email: 'admin@dg.com',
  password: 'password',
  password_confirmation: 'password',
) if Rails.env.development?