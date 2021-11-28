Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root to: 'students/homes#top'
end
