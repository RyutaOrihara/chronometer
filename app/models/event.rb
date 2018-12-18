class Event < ApplicationRecord
  validates :title,:time,:place,:capacity,:content,presence: true
  validates :title,length: { in: 1..30 }
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :favorite_users, through: :favorites,source: :user
  has_many :participations,dependent: :destroy
  has_many :participation_users, through: :participations,source: :user
  mount_uploader :image,ImageUploader
end
