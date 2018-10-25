# frozen_string_literal: true

namespace :migrate_old_data do
  desc 'seed contribution data'
  task contributions: :environment do
    xlsx = Roo::Spreadsheet.open('grasruts.csv.xlsx')
    rewards = xlsx.sheet('grasruts.csv')
    rewards.each_row_streaming(pad_cells: true, offset: 1) do |row|
      puts row
      puts "=============================================================="
      r = Contribution.new(
        amount: row[7].value,
        gateway: 0,
        state: 1,
        ref_id: SecureRandom.alphanumeric(8),
        created_at: "2018-02-#{rand(1..30)}",
        user_id: 1,
        campaign_id: 3
      )
      r.save(validate: false)
    end
  end
end