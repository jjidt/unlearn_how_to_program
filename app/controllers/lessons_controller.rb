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

    insert_at_number = (params[:lesson][:number]).to_i + 1
    Lesson.increment_lessons(insert_at_number)

    @lesson = Lesson.new(params[:lesson])
    @lesson[:number] = insert_at_number

    if @lesson.save
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
    @lesson.update(params[:lesson]) ? redirect_to("/lessons/#{params[:id]}") : render("lessons/edit.html.erb")

  end

  def delete
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    Lesson.decrement_lessons(@lesson.number)
    redirect_to("/")
  end

end
