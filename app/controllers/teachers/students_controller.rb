class Teachers::StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @textbook_student = @student.textbook_students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save

      redirect_to teachers_student_path([@student.id])
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])

  end

  def update
   student = Student.find(params[:id])
    if student.update(student_params)
      redirect_to teachers_student_path(student.id)
    else
    render :edit
    end
  end

  def destroy
    student = Student.find(params[:id])
    if student.destroy
      redirect_to teachers_students_path
    else
      render :show
    end
  end

  private
    def student_params
      params.require(:student).permit(:id,:name, :name_kana, :number,:password,:email, :password_confirmation)
    end

end
