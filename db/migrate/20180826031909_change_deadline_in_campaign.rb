class ChangeDeadlineInCampaign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :deadline
    add_column :campaigns, :deadline, :integer
  end
end
