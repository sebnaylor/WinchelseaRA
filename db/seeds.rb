# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.all.destroy_all
User.destroy_all

puts 'Creating 5 users'
5.times do |i|
    user = User.create!(
        email: Faker::Internet.email,
        name: Faker::FunnyName.name,
        password: "password"
    )
    puts "#{user.id}. #{user.name}"
end

puts 'Creating 5 posts'
5.times do |i|
  post = Post.create!(
    title: Faker::Lorem.sentences(number: 1)[0],
    text: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    user: User.find(rand(1..User.all.count))
  )
  puts "#{i + 1}. #{post.title}"
end
puts 'Finished!'