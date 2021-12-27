class Teachers::StudentsController < ApplicationController
  def index
    @students = Student.page(params[:page]).per(6)
  end

  def show
    @student = Student.find(params[:id])
    @textbooks = @student.textbook_students
    #binding.irb
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

    if student.update(student_update_params)
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
    def student_update_params
      params.require(:student).permit(:name, :name_kana, :number)
    end

end
