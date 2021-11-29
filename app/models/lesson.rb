class Lesson < ApplicationRecord
   belongs_to :teacher
   belongs_to :student
   has_many :textbook_lessons
end
