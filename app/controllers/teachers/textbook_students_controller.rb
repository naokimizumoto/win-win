class Teachers::TextbookStudentsController < ApplicationController
  def index
    @textbook_students = TextbookStudent.all
  end
end
