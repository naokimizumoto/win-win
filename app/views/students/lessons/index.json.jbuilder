json.array!(@lessons) do |lesson|
  json.extract! lesson, :id
  json.start lesson.starts_at
  json.end lesson.ends_at
  if lesson.student.present?
    json.title lesson.student.name
  else
    json.title 'no name'
  end
   if student_signed_in?
  json.url students_lesson_path(lesson.id)
  else
  json.url teachers_lesson_path(lesson.id)
  end
end