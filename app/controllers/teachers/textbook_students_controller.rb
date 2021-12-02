class Teachers::TextbookStudentsController < ApplicationController

  def new
    @textbook = Textbook.new
  end

  def create
    @textbook = Textbook.new(textbook_params)
    if @textbook.save
      redirect_to  teachers_textbook_student_path(@textbook.id)
    else
      render :new
    end
  end

  def index

  end

  def show
    @textbook = Textbook.find(params[:id])
  end
end

private
def textbook_params
  params.require(:textbook).permit(:name, :image)
end