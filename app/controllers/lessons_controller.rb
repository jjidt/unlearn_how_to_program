class LessonsController < ApplicationController

  def new
    @lessons = Lesson.all
    render('lessons/new.html.erb')
  end

  def create
    this_lesson = Lesson.new(params[:lesson])

  end

end
