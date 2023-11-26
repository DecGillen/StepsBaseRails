class AddUserUidToYoutubeEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :youtube_entries, :user_uid, :string
  end
end
