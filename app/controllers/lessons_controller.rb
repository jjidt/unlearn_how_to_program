class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
    @lessons = Lesson.all
    render('lessons/new.html.erb')
  end

  def create
    @lessons = Lesson.all
    params[:lesson][:number] = params[:lesson][:number].to_i
    @lesson = Lesson.new(params[:lesson])
    Lesson.shift_lessons_from(@lesson.number)
    if @lesson.save
      redirect_to("/lessons/#{@lesson.id}")
    else
      render("lessons/new.html.erb")
    end
  end

end
