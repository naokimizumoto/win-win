require 'rails_helper'

describe '[STEP2] 生徒ログイン後のテスト' do
  let(:student) { create(:student) }

  let!(:lesson) { create(:lesson, student: student) }

  let!(:textbook) { create(:textbook, student: student) }


  before do
    visit new_student_session_path
    fill_in 'student[name]', with: student.name
    fill_in 'student[password]', with: student.password
    fill_in 'student[number]', with: student.number
    fill_in 'student[email]', with: student.email
    click_button 'Log in'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『生徒ログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it '授業一覧を押すと、自分の授業一覧に遷移する' do
        students_lessons_link = find_all('a')[1].native.inner_text
        students_lessons_link = students_lessons_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link students_lessons_link
        is_expected.to eq '/students/lessons/'
      end
      it '教材一覧を押すと、教材一覧画面に遷移する' do
        students_textbooks_link = find_all('a')[2].native.inner_text
        students_textbooks_link = students_textbooks_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link students_textbooks_link
        is_expected.to eq '/students/textbooks'
      end
    end
  end

  describe '授業一覧画面のテスト' do
    before do
      visit students_lessons_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/students/lessons'
      end
      it '自分の授業予定一覧が表示される' do
        expect(page).to have_link '', href: students_lesson_path(lesson.id)
      end
      it '自分の授業の開始時間のリンク先が正しい' do
        expect(page).to have_link lesson.starts_at, href: students_lesson_path(lesson.id)
      end
    end
  end

  describe '自分の授業詳細画面のテスト' do
    before do
      visit students_lesson_path(lesson.id)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/students/lesson/' + lesson.id.to_s
      end
      it '授業の講師名が表示される' do
        expect(page).to have_content lesson.teacher.name
      end
      it '授業の生徒名が表示される' do
        expect(page).to have_content lesson.student.name
      end
      it '授業の教材名が表示される' do
        expect(page).to have_content textbook.name
      end
      it '授業予告が表示されている' do
        expect(page).to have_content lesson.notice
      end
    end
  end

  describe '教材一覧画面のテスト' do
    before do
      visit students_textbooks_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/students/textbooks'
      end
      it '自分の教材名が表示される' do
        expect(page).to have_content textbook.name
      end
      it '自分の教材の画像が表示されている' do
        expect(page).to have_content textbook.image
      end
      it '教材画像のリンク先が正しい' do
        expect(page).to have_link 'textbook.image', href: students_textbook_path(textbook)
      end
    end
  end
end

describe '[STEP2] 講師ログイン後のテスト' do
  let!(:teacher) { create(:teacher, lesson: lesson) }

  let!(:lesson) { create(:lesson, teacher: teacher) }

  let!(:student) { create(:student, teacher: teacher) }

  let!(:textbook) { create(:textbook, teacher: teacher) }



  before do
    visit new_teacher_session_path
    fill_in 'teacher[name]', with: teacher.name
    fill_in 'teacher[password]', with: teacher.password
    fill_in 'teacher[email]', with: teacher.email
    click_button 'Log in'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it '授業一覧を押すと、生徒の授業一覧に遷移する' do
        teachers_lessons_link = find_all('a')[1].native.inner_text
        teachers_lessons_link = teachers_lessons_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link teachers_lessons_link
        is_expected.to eq '/teachers/lessons/'
      end
      it '生徒一覧を押すと、生徒一覧画面に遷移する' do
        teachers_students_link = find_all('a')[2].native.inner_text
        teachers_students_link = teachers_students_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link teachers_students_link
        is_expected.to eq '/teachers/students'
      end
    end
  end

  describe '授業一覧画面のテスト' do
    before do
      visit teachers_lessons_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/lessons'
      end
      it '各授業の開始時間が表示され、リンク先が正しい' do
        expect(page).to have_link 'lesson.starts_at', href: teachers_lesson_path(lesson.id)
        expect(page).to have_link '', href: teachers_lesson_path(other_student.lesson)
      end

      it '各授業の生徒名が表示されている' do
        expect(page).to have_content lesson.student.name
      end

      it '新規登録のリンクが表示され、リンク先が正しい' do
        expect(page).to have_link '新規登録', href: new_teachers_student_path
      end
    end

    context '授業新規登録成功のテスト' do
      before do
        fill_in 'lesson[notice]', with: Faker::Lorem.characters(number: 20)
        fill_in 'lesson[text_name]', with: Faker::Lorem.characters(number: 20)
      end

      it '授業新規登録が正しく保存される' do
        expect { click_button '登録する' }.to change(student.lessons, :count).by(1)
      end
      it 'リダイレクト先が、保存できた授業の詳細画面になっている' do
        click_button '登録する'
        expect(current_path).to eq '/teachers/lesson/' + lesson.last.id.to_s
      end
    end
  end

  describe '授業詳細画面のテスト' do
    before do
      visit teachers_lesson_path(lesson.id)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/lesson//' + lesson.id.to_s
      end
      it '講師氏名が表示される' do
        expect(page).to have_content lesson.teacher.name
      end
      it '生徒氏名が表示される' do
        expect(page).to have_content lesson.student.name
      end
      it '教材名が表示される' do
        expect(page).to have_content lesson.text_name
      end
      it '授業予告が表示されている' do
        expect(page).to have_content lesson.notice
      end
      it '編集リンクが表示され、リンク先が正しい' do
        expect(page).to have_link '編集する', href: edit_teachers_lesson_path(lesson.id)
      end
      it '削除リンクが表示され、リンク先が正しい' do
        expect(page).to have_link '削除する', href: teachers_lesson_path(lesson.id)
      end
    end

    context '編集リンクのテスト' do
      it '編集画面に遷移する' do
        click_link '編集する'
        expect(current_path).to eq '/edit_teachers_lesson_path/' + lesson.id.to_s + '/edit'
      end
    end

    context '削除リンクのテスト' do
      before do
        click_link '削除する'
      end

      it '正しく削除される' do
        expect(Lesson.where(id: lesson.id).count).to eq 0
      end
      it 'リダイレクト先が、授業一覧画面になっている' do
        expect(current_path).to eq '/teachers/lessons'
      end
    end
  end

  describe '授業編集画面のテスト' do
    before do
      visit edit_teachers_lesson_path(lesson.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/lesson/' + lesson.id.to_s + '/edit'
      end
      it '「授業編集画面」と表示される' do
        expect(page).to have_content '授業編集画面'
      end
      it '教材名編集フォームが表示される' do
        expect(page).to have_field 'lesson.[text_name]', with: lesson.text_name
      end
      it 'homework編集フォームが表示される' do
        expect(page).to have_field 'lesson[homework]', with: lesson.homework
      end
      it 'feedback編集フォームが表示される ' do
        expect(page).to have_field 'lesson[feedback]', with: lesson.feedback
      end
      it 'notice編集フォームが表示される' do
        expect(page).to have_field 'lesson[notice]', with: lesson.notice
      end
    end

    context '授業編集成功のテスト' do
      before do
        @lesson_old_text_name = lesson.text_name
        @lesson_old_text_homework = lesson.homework
        @lesson_old_feedback = lesson.feedback
        @lesson_old_notice = lesson.notice

        fill_in 'lesson[text_name]', with: Faker::Lorem.characters(number: 20)
        fill_in 'lesson[homework]', with: Faker::Lorem.characters(number: 50)
        fill_in 'lesson[feedback]', with: Faker::Lorem.characters(number: 50)
        fill_in 'lesson[notice]', with: Faker::Lorem.characters(number: 50)
        click_button '編集する'
      end

      it 'text_nameが正しく更新される' do
        expect(lesson.reload.text_name).not_to eq @lesson_old_text_name
      end
      it 'homeworkが正しく更新される' do
        expect(lesson.reload.homework).not_to eq @lesson_old_homework
      end
      it 'feedbackが正しく更新される' do
        expect(lesson.reload.feedback).not_to eq @lesson_old_feedback
      end
      it 'noticeが正しく更新される' do
        expect(lesson.reload.notice).not_to eq @lesson_old_notice
      end
      it 'リダイレクト先が、更新した授業の詳細画面になっている' do
        expect(current_path).to eq '/teachers/lesson/' + lesson.id.to_s
        expect(page).to have_content '授業詳細'
      end
    end
  end

  describe '生徒一覧画面のテスト' do
    before do
      visit teachers_students_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/students'
      end
      it '生徒番号一覧が表示されている' do
        expect(page).to have_content student.number
      end
      it '生徒名がリンク付き一覧で表示され、リンク先が正しい' do
        expect(page).to have_link 'student.name', href: teachers_student_path(student.id)
        expect(page).to have_link 'other_student.name', href: teachers_student_path(other_student.id)
      end
      it '生徒新規登録がリンクで表示され、リンク先が正しい' do
        expect(page).to have_link '生徒新規登録', href: new_teachers_student_path
      end
       it '教材新規登録がリンクで表示され、リンク先が正しい' do
        expect(page).to have_link '教材新規登録', href: new_teachers_textbook_path
      end
      it '生徒教材の新規登録がリンクで表示され、リンク先が正しい' do
        expect(page).to have_link '生徒教材の新規登録', href: new_teachers_textbook_student_path
      end
    end
  end

  describe '生徒詳細画面のテスト' do
    before do
      visit teachers_student_path(student.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/student/' + student.id.to_s
      end
      it '使用教材が表示され、リンク先が正しい' do
        expect(page).to have_link '', href: teachers_textbook_student_path(textbook_student.id)
      end
      it '編集リンクが表示され、リンク先が正しい' do
        expect(page).to have_link '編集する', href: edit_teachers_student_path(student.id)
      end
      it '生徒名が表示される' do
        expect(page).to have_content student.name
      end
       it '生徒名かなが表示される' do
        expect(page).to have_content student.name_kana
      end
       it '生徒番号が表示される' do
        expect(page).to have_content student.number
      end
    end
  end

  describe '生徒編集画面のテスト' do
    before do
      visit edit_teachers_student_path(student.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/students/' + user.id.to_s + '/edit'
      end
      it '名前編集フォームに生徒の名前が表示される' do
        expect(page).to have_field 'student[name]', with: student.name
      end
      it '名前かな編集フォームが表示される' do
        expect(page).to have_field 'student[name_kana]', with: student.name_kana
      end
      it '生徒番号編集フォームが表示される' do
        expect(page).to have_field 'student[number]', with: student.number
      end
      it '編集するボタンが表示される' do
        expect(page).to have_button '編集する'
      end
    end


    context '編集更新成功のテスト' do
      before do
        @student_old_name = student.name
        @student_old_name_kana = student.name_kana
        @student_old_nunber = student.number
        fill_in 'student[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[name_kana]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[number]', with: Faker::Lorem.characters(number: 10)
        click_button '編集する'
      end

      it 'nameが正しく更新される' do
        expect(student.reload.name).not_to eq @student_old_name
      end
      it 'name_kanaが正しく更新される' do
        expect(student.reload.name_kana).not_to eq @student_old_kana
      end
      it 'numberが正しく更新される' do
        expect(student.reload.number).not_to eq @student_old_number
      end
      it 'リダイレクト先が、生徒の詳細画面になっている' do
        expect(current_path).to eq '/teachers/student/' + student.id.to_s
      end
    end
  end

  describe '生徒教材詳細画面のテスト' do
    before do
      visit teachers_textbook_student_path(textbook_student.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/textbook/students/' + student.id.to_s
      end
      it '生徒教材の表紙が表示される' do
        expect(page).to have_field '', with: textbook_student.textbook.image
      end
    end
  end

  describe '生徒新規登録画面のテスト' do
    before do
      visit new_teachers_student_path
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/students/new'
      end
       it 'nameフォームが表示される' do
        expect(page).to have_field 'student[name]'
      end
      it 'name_kanaフォームが表示される' do
        expect(page).to have_field 'student[name_kana]'
      end
      it '生徒番号フォームが表示される' do
        expect(page).to have_field 'student[number]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'student[email]'
      end
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'student[password]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '生徒新規登録成功のテスト' do
      before do
        fill_in 'student[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[name_kana]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[number]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[email]', with: Faker::Lorem.characters(number: 10)
        fill_in 'student[password]', with: Faker::Lorem.characters(number: 10)
      end


      it '生徒の新規登録が正しく保存される' do
        expect { click_button '新規登録' }.to change(teachers.students, :count).by(1)
      end
      it 'リダイレクト先が、生徒詳細画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/teachers/students/' + Student.last.id.to_s
      end
    end
  end

  describe '教材新規登録画面のテスト' do
    before do
      visit new_teachers_textbook_path
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/teachers/textbooks/new'
      end
       it 'nameフォームが表示される' do
        expect(page).to have_field 'textbook[name]'
      end
      it 'textbook.imageフォームが表示される' do
        expect(page).to have_field 'textbook[image]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '教材新規登録成功のテスト' do
      before do
        fill_in 'textbook[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'textbook[image]', with: Faker::Lorem.characters(number: 10)
      end


      it '教材の新規登録が正しく保存される' do
        expect { click_button '新規登録' }.to change(textbooks, :count).by(1)
      end
      it 'リダイレクト先が、生徒の一覧画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/teachers/students/'
      end
    end
  end
end
