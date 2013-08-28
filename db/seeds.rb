require 'faker'

15.times do
  Url.create(webpage: "http://" + Faker::Internet.domain_name)
end
