FactoryBot.define do
  factory :user do
    name { "general_user" }
    email { "general_user@example.com" }
    password { "11111111" }
    password_confirmation { "11111111" }
    admin { "false" }
  end

  factory :admin_user, class: User do
    name { "admin_test" }
    email { "admin_test@example.com" }
    password { "11111111" }
    password_confirmation { "11111111" }
    admin { "true" }
  end
end
