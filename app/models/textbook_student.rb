class TextbookStudent < ApplicationRecord
  belongs_to :textbook
  belongs_to :student
end
