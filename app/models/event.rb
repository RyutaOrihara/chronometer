class Event < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :participations, dependent: :destroy
  has_many :participation_users, through: :participations, source: :user

  mount_uploader :image,ImageUploader

  validate :time_cannot_be_in_the_past, :time_cannot_be_later_than_end_datetime
  validate :add_error_image
  validates :title, :time, :endtime, :place, :capacity, :content, presence: true
  validates :title, length: { in: 1..30 }
  validates :capacity, numericality: { greater_than_or_equal_to: 0 }

 private

  def time_cannot_be_in_the_past
    if time.present? && time < Date.today
      errors.add(:time,"は今日より過去は設定できません")
    end
  end

  def time_cannot_be_later_than_end_datetime
    if time.present? && time > endtime
      errors.add(:time,"は終了日より後に設定できません")
    end
  end

  def add_error_image
  # imageが空のときにエラーメッセージを追加する
    if image.blank?
      errors[:base] << "画像を選択してください"
    end
  end
end
