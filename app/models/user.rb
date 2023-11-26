class User < ApplicationRecord
validates :user_uid, uniqueness: true
validates :userName, uniqueness: true
end
