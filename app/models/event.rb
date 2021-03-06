class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendance, foreign_key: :event
  default_scope { order(date: :desc) }
end
