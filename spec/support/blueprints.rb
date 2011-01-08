require 'machinist/active_record'
require 'sham'
require 'faker'
require 'date'

Sham.username  { Faker::Name.name }
Sham.password  { Faker::Base.bothify('######') }
Sham.email  { Faker::Internet.email }
Sham.provider { Faker::Base.letterify('######')}
Sham.uid { Faker::Base.numerify('###')}
Sham.link  { "http://" +Faker::Internet.domain_name }
Sham.title { Faker::Lorem.sentence }
Sham.description { Faker::Lorem.paragraph}
Sham.date { DateTime.current }

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

Setting.blueprint do
  user
  send_to { Sham.email}
  items_after { Sham.date }
end
