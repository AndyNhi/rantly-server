User.delete_all
Rant.delete_all


1.times do

  user = User.create!(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: "admin@email.com",
            password: "password",
            password_confirmation: "password"
            )

  10.times do
    Rant.create!(
      user_id: user.id,
      title: Faker::Name.title,
      body: Faker::Lorem.sentence,
    )
  end

end
