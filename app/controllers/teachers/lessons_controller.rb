class Teachers::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
     @lesson = Lesson.find(params[:id])
     if student_signed_in?
       redirect_to students_lesson_path(@lesson.id)
     end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save!
     redirect_to teachers_lesson_path(@lesson.id)
    else
     render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])

  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to teachers_lesson_path(@lesson.id)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to teachers_lessons_path
  end

  private

  def lesson_params
   params.require(:lesson).permit(:student_id,:teacher_id,:homework,:feedback,:text_name,:notice,:starts_at,:ends_at)
  end

end
