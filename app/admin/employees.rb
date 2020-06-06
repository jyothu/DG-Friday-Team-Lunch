ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :email, :encrypted_password
end
