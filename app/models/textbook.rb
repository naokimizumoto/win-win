class Textbook < ApplicationRecord
   attachment :image
   has_many :textbook_students
   validates :name, presence: true
   validates :image, presence: true
end
