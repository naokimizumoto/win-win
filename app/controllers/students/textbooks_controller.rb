class Students::TextbooksController < ApplicationController
  @textbooks = Textbook.all
end
