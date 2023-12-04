json.extract! favourite, :id, :title, :embed_link, :user_uid, :logged_user, :created_at, :updated_at if favourite
json.url favourite_url(favourite, format: :json) if favourite
