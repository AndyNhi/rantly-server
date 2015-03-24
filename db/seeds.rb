User.delete_all
Rant.delete_all

user = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password"
)

5.times do
  Rant.create!(
    user_id: user.id,
    title: Faker::Name.title,
    body: Faker::Lorem.sentence,
  )
end

user2 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "user@email.com",
  password: "password",
  password_confirmation: "password"
)

5.times do
  Rant.create!(
    user_id: user2.id,
    title: Faker::Name.title,
    body: Faker::Lorem.sentence,
  )
end


10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end
