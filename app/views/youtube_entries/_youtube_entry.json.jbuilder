json.extract! youtube_entry, :id, :title, :embed_link, :user_uid, :created_at, :updated_at
json.url youtube_entry_url(youtube_entry, format: :json)
