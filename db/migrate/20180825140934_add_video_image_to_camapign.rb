class AddVideoImageToCamapign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :video_image, :string
  end
end
