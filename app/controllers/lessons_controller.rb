class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
    @lessons = Lesson.all
    render('lessons/new.html.erb')
  end

  def index
    @lessons = Lesson.all.order(:number)
    render('lessons/index.html.erb')
  end

  def create
    @lessons = Lesson.all
    @lesson = Lesson.new(params[:lesson])
    if @lesson.valid?
       Lesson.shift_lessons_from(@lesson.number)
       @lesson.save
       redirect_to("/lessons/#{@lesson.id}")
    else
      render("lessons/new.html.erb")
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    render('lessons/show.html.erb')
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(params[:lesson])
    render('/lessons/show.html.erb')
  end

  def delete
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to("/")
  end

end
