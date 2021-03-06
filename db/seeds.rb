require 'faker'
# Create myself
User.create!(
  name: 'example',
  email: 'example@example.com',
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

# Create lists
25.times do
  List.create!(
  title: Faker::Hacker.noun,
  user_id: User.all.sample.id,
  public: false,
  created_at: rand(10.minutes .. 1.year).ago
  )
end

# Create todos
100.times do
  Item.create!(
  title: Faker::Hacker.say_something_smart,
  list_id: List.all.sample.id,
  created_at: rand(10.minutes .. 1.year).ago
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
puts "#{List.count} lists created"
