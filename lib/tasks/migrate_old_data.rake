namespace :migrate_old_data do

  desc 'seed user data'
  task :user do
    xlsx = Roo::Spreadsheet.open('old grasruts data.xlsx')
    user_wb = xlsx.sheet(user)
    user_wb.each_row_streaming(pad_cells: true) do |row|
      User.find_or_create_by(
        email: row[1],
        name: row[2],
        created_at: row[3],
        updated_at: row[4],
        address: row[5],
        city: row[6],
        contact_number: row[7],
        encrypted_password: row[8],
        twitter: row[9],
        facebook: row[10],
        about: row[15],
        confirmed_at: Date.now,
        provider: '',
        country: 'NP',

      )
    end
  end
end
