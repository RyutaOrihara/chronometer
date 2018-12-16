class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :favorite_users, through: :favorites,source: :user
end
