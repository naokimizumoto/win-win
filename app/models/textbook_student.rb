class TextbookStudent < ApplicationRecord
  belongs_to :textbook
  belongs_to :student
  validates :student_id, presence: true
  validates :textbook_id, presence: true
end
