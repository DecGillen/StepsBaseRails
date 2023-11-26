class CreateYoutubeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :youtube_entries do |t|
      t.string :title
      t.string :embed_link
      #t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
