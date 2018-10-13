# frozen_string_literal: true

namespace :migrate_old_data do
  desc 'seed user data'
  task user: :environment do
    xlsx = Roo::Spreadsheet.open('old grasruts data.xlsx')
    user_wb = xlsx.sheet('user')
    user_wb.each_row_streaming(pad_cells: true, offset: 1) do |row|
      puts row
      puts "=============================================================="
      User.create!(
        email: row[1],
        name: row[2],
        created_at: row[3].value,
        updated_at: row[4].value,
        address: row[5],
        city: row[6],
        contact_number: row[7],
        password: 'password123',
        twitter: row[9],
        facebook: row[10],
        about: row[14],
        confirmed_at: Time.now,
        provider: 'facebook',
        country: 'NP'
      )
    end
  end

  desc 'seed campaign data'
  task campaign: :environment do
    xlsx = Roo::Spreadsheet.open('old grasruts data.xlsx')
    campaign_wb = xlsx.sheet('projects')
    campaign_wb.each_row_streaming(pad_cells: true, offset: 1) do |row|
      c = Campaign.create!(
        name: row[1],
        about: row[9],
        goal: row[4].value,
        card_description: row[5],
        uri: row[11],
        deadline: row[14].value,
        published_date: Time.now,
        created_at: row[7].value,
        updated_at: row[8].value,
        user_id: 417,
        campaign_category_id: 1
      )
    end
  end
end
