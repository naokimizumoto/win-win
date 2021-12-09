class Textbook < ApplicationRecord
   attachment :image
   has_many :textbook_students
end
