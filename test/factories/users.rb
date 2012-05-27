# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test_user@test_domain.com"
    password "test_password"
    password_confirmation "test_password"
  end
end
