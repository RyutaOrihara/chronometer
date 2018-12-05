class Event < ApplicationRecord
  validates :title,:time,:place,:capacity,:content,presence: true
  validates :title,length: { in: 1..30 }
end
