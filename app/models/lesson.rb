class Lesson < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :number, presence: true
  validates :content, presence: true

  def self.shift_lessons_from(start_index)
    index = start_index.to_i
    where("number >= #{index}").each { |lesson| lesson.update( {:number => (lesson.number + 1) } )  }
  end

  def next_lesson
    Lesson.find_by(:number => (self.number + 1))
  end
end

