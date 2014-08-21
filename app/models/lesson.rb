class Lesson < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :number, presence: true
  validates :content, presence: true

  def self.shift_lessons_from(start_index)
    # look for error here in case justin is wrong
    where("number >= #{start_index}").each do |lesson|
      binding.pry
      lesson.update( {:number => (lesson.number + 1) } )# + index) } )
    end
  end

  def next_lesson
    Lesson.find_by(:number => (self.number + 1))
  end
end

