require 'faker'

15.times do
  Url.create(webpage: "http://" + Faker::Internet.domain_name)
end

15.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, new_password: 'hello1', new_password_confirmation: 'hello1')
end

User.create(name: 'master', email: 'master@master.com', new_password: 'hello1', new_password_confirmation: 'hello1')

60.times do
    Url.create(webpage: "http://" + Faker::Internet.domain_name, user_id: rand(1..16))
end
