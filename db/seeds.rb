# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# (c) Wilfried PAILLOT
DatabaseCleaner.clean_with(:truncation)

# Création de mails
puts
puts "SEEDING - Création de quelques fake mails"
puts

5.times do |x|
  Email.create(object: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop, 
               body: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
               read: false,
               image: rand(1..5).to_s)
  puts "-"*25
  puts "Email n°: #{Email.all.last.id} - Object: #{Email.all.last.object} - Body: #{Email.all.last.body} - Read: #{Email.all.last.read} - Image: #{Email.all.last.image}"
  puts "-"*25
end