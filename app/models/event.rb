class Event < ApplicationRecord
  validates :title,:time,:place,:capacity,:content,presence: true
  validates :title,length: { in: 1..30 }
  has_many :favorites,dependent: :destroy
  has_many :favorite_users, through: :favorites,source: :user
  belongs_to :user
end
