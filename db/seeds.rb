User.delete_all
Rant.delete_all


2.times do
  user = User.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            password_digest: "password"
        )
  2.times do
    Rant.create!(
      user_id: user.id,
      title: Faker::Name.title,
      body: Faker::Lorem.sentence,
    )
  end

end
