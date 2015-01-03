# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "gekke henkie"
    email "piet@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
