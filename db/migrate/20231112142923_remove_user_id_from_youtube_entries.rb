class RemoveUserIdFromYoutubeEntries < ActiveRecord::Migration[7.0]
  def change
    remove_column :youtube_entries, :user_id, :integer
  end
end
