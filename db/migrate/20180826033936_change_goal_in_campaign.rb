class ChangeGoalInCampaign < ActiveRecord::Migration[5.1]
  def change
    remove_column :campaigns, :goal
    add_column :campaigns, :goal, :integer
  end
end
