class Students::LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(student_id: current_student.id)
  end

  def show
   @lesson = Lesson.find(params[:id])
  end
end
