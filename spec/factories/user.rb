FactoryBot.define do
  factory :user do
    name { "John" }
    email  { "test@gmail.com" }
    provider { "email" }
    address { "kaldhara" }
    country { "NP" }
    contact_number { 981981981981 }
    city { 'Kathmandu' }
    password 'password'
    password_confirmation 'password'
    admin { false }
  end
end