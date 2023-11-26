class YoutubeEntry < ApplicationRecord
  validates :title, presence: true
  validates :embed_link, presence: true
  attribute :user_uid, :string
end
