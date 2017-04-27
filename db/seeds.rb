20.times do
  Wiki.create!(
    title: Faker::StarWars.quote,
    body: Faker::StarWars.wookie_sentence
  )
end

30.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Crypto.md5
  )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
