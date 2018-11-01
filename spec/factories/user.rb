# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John' }
    email  { 'test@gmail.com' }
    provider { 'email' }
    address { 'kaldhara' }
    country { 'NP' }
    contact_number { 981_981_981_981 }
    city { 'Kathmandu' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
end
