require 'faker'
# Create myself
User.create!(
  name: 'example',
  email: 'email@example.com',
  password: 'password'
)
# Create users
25.times do
  User.create!(
  name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all

# Create lists
25.times do
  list = List.create!(
  title: Faker::Hacker.noun,
  user_id: users.sample.id,
  )
  list.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
lists = List.all

# Create todos
100.times do
  item = Item.create!(
  title: Faker::Hacker.say_something_smart,
  # user_id: users.sample.id,
  list_id: lists.sample.id
  )
  item.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
puts "#{List.count} lists created"
