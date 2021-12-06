class Teachers::TextbookStudentsController < ApplicationController

  def new
    @textbook_student = TextbookStudent.new
  end

  def create
    @textbook_student = TextbookStudent.new(textbook_student_params)
    if @textbook_student.save
      redirect_to  teachers_textbook_student_path(@textbook_student.id)
    else
      render :new
    end
  end

  def show
    @textbook_student = TextbookStudent.find(params[:id])
  end
end

private
def textbook_student_params
  params.require(:textbook_student).permit(:student_id,:textbook_id)
end