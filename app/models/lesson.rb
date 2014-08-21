class Lesson < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :content, presence: true


end
