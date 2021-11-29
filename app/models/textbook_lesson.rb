class TextbookLesson < ApplicationRecord
  belongs_to :textbook
  belongs_to :lesson
end
