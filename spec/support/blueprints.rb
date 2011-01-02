require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.username  { Faker::Name.name }
Sham.password  { Faker::Base.bothify('######') }
Sham.email  { Faker::Internet.email }
Sham.provider { Faker::Base.letterify('######')}
Sham.uid { Faker::Base.numerify('###')}

User.blueprint do
  username 
  password 
  email 
end

