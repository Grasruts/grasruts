# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "=========Seeding CampaignCategory============="
CampaignCategory.find_or_create_by(name: 'Art & Design')
CampaignCategory.find_or_create_by(name: 'Film & Video')
CampaignCategory.find_or_create_by(name: 'Technology')
CampaignCategory.find_or_create_by(name: 'Game')
CampaignCategory.find_or_create_by(name: 'Book')
CampaignCategory.find_or_create_by(name: 'Community')
CampaignCategory.find_or_create_by(name: 'Travel')
CampaignCategory.find_or_create_by(name: 'Social Cause')
puts "======Finished Seeding CampaignCategory======="