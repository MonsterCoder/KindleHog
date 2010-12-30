Factory.define :user do |f|
  f.sequence(:username) { |n| "user#{n}" }
  f.sequence(:email) { |n| "user#{n}@example.com" }
  f.password "123456"
end
