require 'rails_helper'


describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should ensure_length_of(:name).is_at_most(30) }
  it { should validate_presence_of :number }

  context '#next' do
    it "returns the next lesson in order" do
      first_lesson = Lesson.create(name: "First Lesson", content: "Find old computer with QBasic", number: 1)
      second_lesson = Lesson.create(name: "Second Lesson", content: "The indispensable GOTO", number: 2)
      expect(first_lesson.next_lesson).to eq second_lesson
    end
  end

  context '.shift_lessons_from(start_index)' do
    it 'increments the number column by one for every record where number >= start_index' do
      first_lesson = Lesson.create(name: "Preface", content: "Find old computer in dumpster", number: 1)
      second_lesson = Lesson.create(name: "Intro", content: "Some people make programs. We will be destroying them.", number: 2)
      third_lesson = Lesson.create(name: "Chapter 1", content: "Accidental malware as an art form", number: 3)

      Lesson.shift_lessons_from(1)

      expect(Lesson.find(first_lesson.id).number).to eq 2
      expect(Lesson.find(second_lesson.id).number).to eq 3
      expect(Lesson.find(third_lesson.id).number).to eq 4
    end
  end


end
