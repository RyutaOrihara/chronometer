class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event
  has_many :participations,dependent: :destroy
  has_many :participation_events, through: :participations, source: :event
  has_many :active_relationships, foreign_key: 'follower_id',class_name: 'Relationship',dependent: :destroy
  has_many :passive_relationships,foreign_key: 'followed_id',class_name: 'Relationship',dependent: :destroy
  has_many :following,through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :events  
  mount_uploader :image,ImageUploader
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  validates :username,presence: true,length:{maximum:30}
  validates :email, format:{with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  before_validation { email.downcase! }
end
