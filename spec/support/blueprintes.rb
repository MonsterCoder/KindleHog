require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.username  { Faker::Name.name }
Sham.password  { Faker::Base.bothify('######') }
Sham.email  { Faker::Internet.email }

User.blueprint do
  username 
  password 
  email 
end
