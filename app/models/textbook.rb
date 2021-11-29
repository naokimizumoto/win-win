class Textbook < ApplicationRecord
   attachment :image
   has_many :textbook_lessons
   has_many :textbook_students
end
