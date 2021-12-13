class Lesson < ApplicationRecord
   belongs_to :teacher
   belongs_to :student
   validates :student_id, presence: true
   validates :teacher_id, presence: true
   validates :starts_at, presence: true
   validates :ends_at, presence: true
   validates :homework, presence: true
   validates :notice, presence: true
end
