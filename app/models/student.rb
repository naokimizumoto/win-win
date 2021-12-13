class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lessons
  has_many :textbook_students
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
