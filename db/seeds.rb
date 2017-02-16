# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_role = Role.find_or_create_by!(name: 'admin')
user_role = Role.find_or_create_by!(name: 'user')

puts "Roles Created!"

User.find_or_create_by(email: 'admin@example.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.role_id = admin_role.id
end

puts "Admin Created!"

User.find_or_create_by(email: 'dummy@example.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.role_id = user_role.id
end

puts "Dummy User Created!"

admin = User.find_by(email: 'admin@example.com')


10.times do |i|
  proj = Project.new(
    user_id:     admin.id,
    name:         Faker::App.name,
    caption:     'Random Caption',
    author_name:  Faker::App.author,
    description:  Faker::Lorem.sentence,
    git_url:      Faker::Internet.url('github.com'),
    demo_url:     Faker::Internet.url,
    twitter_id:   Faker::Internet.url('twitter.com'),
    approved:     true
    )

  proj.save

  puts "Project #{proj.name} saved!"
end

puts "Project Seeding Complete!!!"
