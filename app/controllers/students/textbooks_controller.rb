class Students::TextbooksController < ApplicationController
  def index
  @textbooks = Textbook.page(params[:page]).reverse_order
  end

  def show
    @textbook = Textbook.find(params[:id])
  end
end
