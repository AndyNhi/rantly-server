module ObjectCreationMethods

  def create_user(overrides = {})
    User.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password_digest: 'password'
    }.merge(overrides))
  end

end
