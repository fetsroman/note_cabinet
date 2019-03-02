FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password" }
  end

  factory :doc do
    title { "Title" }
    content { "Some content" }

    user
  end
end