Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root to: 'students/homes#top'
  get 'teacher' =>'teachers/homes#top'

  namespace :students do
  resources :lessons, only: [:index,:show]
  resources :textbooks, only: [:index,:show]
  end

  namespace :teachers do
  resources :lessons
  resources :textbook_lessons, only: [:show]
  resources :textbook_students, only: [:show]
  resources :students
  end
end
