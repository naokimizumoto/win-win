class Teachers::TextbooksController < ApplicationController

  def new
    @textbook = Textbook.new
  end

  def create
    @textbook = Textbook.new(textbook_params)
    if @textbook.save
      redirect_to teachers_students_path
    else
      render :new
    end

  end

  private
  def textbook_params
   params.require(:textbook).permit(:name,:image)
  end
end
