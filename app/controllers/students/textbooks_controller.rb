class Students::TextbooksController < ApplicationController
  def index
  @textbooks = Textbook.all
  end

  def show
    @textbook = Textbook.find(params[:id])
  end
end
