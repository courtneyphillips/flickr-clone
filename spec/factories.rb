FactoryGirl.define do
  factory(:user) do
    email('john@does.com')
    password('badpasswrod123')
  end

  factory(:picture) do
    title('Cute Kitten')
    user
  end
end
