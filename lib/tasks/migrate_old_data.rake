# frozen_string_literal: true

namespace :migrate_old_data do
  desc 'seed rewards data'
  task rewards: :environment do
    xlsx = Roo::Spreadsheet.open('old grasruts data.xlsx')
    rewards = xlsx.sheet('rewards')
    rewards.each_row_streaming(pad_cells: true, offset: 1) do |row|
      puts row
      puts "=============================================================="
      r = Reward.new(
        name: row[7],
        price: row[2].value,
        description: row[4],
        shipping_date: row[8].value
      )
      r.save(validate: false)
    end
  end
end