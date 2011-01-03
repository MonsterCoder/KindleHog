require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.username  { Faker::Name.name }
Sham.password  { Faker::Base.bothify('######') }
Sham.email  { Faker::Internet.email }
Sham.provider { Faker::Base.letterify('######')}
Sham.uid { Faker::Base.numerify('###')}
Sham.link  { "http://" +Faker::Internet.domain_name }
Sham.title { Faker::Lorem.sentence }
Sham.description { Faker::Lorem.paragraph}

User.blueprint do
  username 
  password 
  email 
end

Subscription.blueprint do
  user
  link 
  title 
  description
end
