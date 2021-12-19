require 'rails_helper'

describe '[STEP3] 仕上げのテスト' do
  let!(:student) { create(:student) }
  let!(:lesson) { create(:lesson) }
  let!(:teacher) { create(:teacher, lesson: lesson) }


  describe 'サクセスメッセージのテスト' do
    subject { page }

    it '生徒新規登録成功時' do
      visit new_teachers_student_path
      fill_in 'student[name]', with: Faker::Lorem.characters(number: 10)
      fill_in 'student[name_kana]', with: Faker::Lorem.characters(number: 10)
      fill_in 'student[number]',with: Faker::Lorem.characters(number: 10)
      fill_in 'student[email]', with: Faker::Lorem.characters(number: 20)
      fill_in 'student[password]', with: 'password'
      fill_in 'student[password_confirmation]', with: 'password'
      click_button '新規登録'
      is_expected.to have_content 'successfully'
    end
    it '生徒編集成功時' do
      visit edit_teachers_student_path(student.id)
      fill_in 'student[name]', with: student.name
      fill_in 'student[name_kana]', with: student.name_kana
      fill_in 'student[number]',with: student.number
      fill_in 'student[email]', with: student.email
      fill_in 'student[password]', with: 'password'
      fill_in 'student[password_confirmation]', with: 'password'
      click_button '編集する'
      is_expected.to have_content 'successfully'
    end
    it '教材新規登録成功時' do
      visit new_teachers_textbook_path
      fill_in 'textbook[name]', with: Faker::Lorem.characters(number: 10)
      click_button '新規登録'
      is_expected.to have_content 'successfully'
    end
    it '生徒教材の新規登録成功時成功時' do
      visit new_teachers_textbook_student_path
      fill_in 'textbook_student[teacher_id]', with: Faker::Lorem.characters(number: 9)
      fill_in 'textbook_student[student.id]', with: Faker::Lorem.characters(number: 9)
      click_button '新規登録'
      is_expected.to have_content 'successfully'
    end
    it '生徒ログイン成功時' do
      visit new_student_session_path
      fill_in 'student[name]', with: student.name
      fill_in 'student[number]', with: student.number
      fill_in 'student[email]', with: student.email
      fill_in 'student[password]', with: 'password'
      fill_in 'student[password_confirmation]', with: 'password'
      click_button 'ログインして進む'
      is_expected.to have_content 'successfully'
    end
    it '生徒ログアウト成功時' do
      visit destroy_student_session_path
      fill_in 'student[name]', with: student.name
      fill_in 'student[password]', with: student.password
      click_button 'ログアウト'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
      is_expected.to have_content 'successfully'
    end
    it '講師ログイン成功時' do
      visit teacher_session_path
      fill_in 'teacher[name]', with: teacher.name
      fill_in 'teacher[email]', with: teacher.email
      fill_in 'teacher[password]', with: 'password'
      click_button 'Log in'
      is_expected.to have_content 'successfully'
    end
    it '講師ログアウト成功時' do
      visit destroy_teacher_session_path
      fill_in 'teacher[name]', with: teacher.name
      fill_in 'teacher[email]', with: teacher.email
      fill_in 'teacher[password]', with: 'password'
      click_button 'ログアウト'
      is_expected.to have_content 'successfully'
    end
    it '授業新規登録成功時' do
      visit new_teachers_lesson_path
      fill_in 'lesson[text_name]', with: lesson.text_name
      fill_in 'lesson[notice]', with: lesson.notice
      fill_in 'lesson[feedback]', with: lesson.feedback
      fill_in 'lesson[homework]', with: lesson.homework
      click_button '登録する'
      is_expected.to have_content 'successfully'
    end
    it '授業編集成功時' do
      visit edit_teachers_lesson_path(lesson.id)
      fill_in 'lesson[text_name]', with: lesson.text_name
      fill_in 'lesson[notice]', with: lesson.notice
      fill_in 'lesson[feedback]', with: lesson.feedback
      fill_in 'lesson[homework]', with: lesson.homework
      click_button '編集する'
      is_expected.to have_content 'successfully'
    end
  end

  describe '処理失敗時のテスト' do
    context '生徒新規登録失敗: nameを1文字にする' do
      before do
        visit new_teachers_student_path
        @name = Faker::Lorem.characters(number: 1)
        @name_kana = Faker::Lorem.characters(number: 1)
        @number = Faker::Lorem.characters(number: 1)
        @email = 'a' + student.email # 確実にuser, other_userと違う文字列にするため
        fill_in 'student[name]', with: @name
        fill_in 'student[name_kana]', with: @name_kana
        fill_in 'student[number]', with: @number
        fill_in 'student[email]', with: @email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '新規登録されない' do
        expect { click_button '新規登録' }.not_to change(Student.all, :count)
      end
      it '生徒新規登録画面を表示しており、フォームの内容が正しい' do
        click_button '新規登録'
        expect(page).to have_content '新規登録'
        expect(page).to have_field 'student[name]', with: @name
        expect(page).to have_field 'student[name_kana]', with: @name_kana
        expect(page).to have_field 'student[number]', with: @number
        expect(page).to have_field 'student[email]', with: @email
        expect(page).to have_field 'student[password]', with: 'password'
        expect(page).to have_field 'student[password_confirmation]', with: 'password_confirmation'
      end
      it 'バリデーションエラーが表示される' do
        click_button '新規登録'
        expect(page).to have_content "氏名を入力してください"
      end
    end

    context '生徒情報編集失敗: nameを1文字にする' do
      before do
        @student_old_name = student.name
        @name = Faker::Lorem.characters(number: 1)
        visit edit_teachers_student_path(student.id)
        fill_in 'student[name]', with: @student_old_name
        fill_in 'student[name_kana]', with: student.name_kana
        fill_in 'student[number]', with: student.number
        click_button '編集する'
      end

      it '更新されない' do
        expect(student.reload.name).to eq @student_old_name
      end
      it '生徒編集画面を表示しており、フォームの内容が正しい' do
        expect(page).to have_field 'student[name]', with: @name
      end
      it 'バリデーションエラーが表示される' do
        expect(page).to have_content "氏名を入力してください"
      end
    end

    context '教材の新規投稿失敗: nameを空にする' do
      before do
        visit new_teachers_textbook_path
        fill_in 'textbook[name]', with: textbook.name
        fill_in 'textbook[image]', with: textbook.image
        click_button '新規登録'
      end

      it '投稿が保存されない' do
        expect { click_button '新規登録' }.not_to change(Textbook.all, :count)
      end
      it '教材登録画面が表示されている' do
        click_button '新規登録'
        expect(current_path).to eq '/teachers/textbooks/new'
        expect(page).to have_field textbook.name
        expect(page).to have_field textbook.image
      end
      it 'バリデーションエラーが表示される' do
        click_button '新規登録'
        expect(page).to have_content "教材名を入力してください"
      end
    end

    context '授業の新規登録失敗: noticeを空にする' do
      before do
        visit new_user_session_path
        fill_in 'lesson[text_name]', with: lesson.text_name
        fill_in 'lesson[feedback]', with: lesson.feedback
        fill_in 'lesson[homework]', with: lesson.homework
        fill_in 'lesson[notice]', with: lesson.notice
        click_button 'Log in'
        visit new_teachers_lessons_path
        fill_in 'lesson[text_name]', with: lesson.text_name
        fill_in 'lesson[feedback]', with: lesson.feedback
        fill_in 'lesson[homework]', with: lesson.homework
        fill_in 'lesson[notice]', with: ''
        click_button '新規登録'
      end

      it '登録が成功しない' do
       expect { click_button '新規登録' }.not_to change(Lesson, :count)
      end
      it '授業登録画面を表示しており、フォームの内容が正しい' do
        expect(current_path).to eq '/teachers/lessons/new/'
        expect(find_field('lesson[notice]').text).to be_blank
        expect(page).to have_field 'lesson[text_name]', with: lesson.text_name
        expect(page).to have_field 'lesson[feedback]', with: lesson.feedback
        expect(page).to have_field 'lesson[homework]', with: lesson.homework
      end
      it 'エラーメッセージが表示される' do
        expect(page).to have_content '授業予告を入力してください'
      end
    end
  end

  describe 'ログインしていない場合のアクセス制限のテスト: アクセスできず、ログイン画面に遷移する' do
    subject { current_path }

    it '授業一覧画面' do
      visit students_lessons_path
      is_expected.to eq '/students/sign_in'
    end
    it '授業詳細画面' do
      visit students_lesson_path(lesson.id)
      is_expected.to eq '/students/sign_in'
    end
    it '教材一覧画面' do
      visit students_textbooks_path
      is_expected.to eq '/students/sign_in'
    end
    it '教材詳細画面' do
      visit students_textbook_student_path(textbook_student.id)
      is_expected.to eq '/students/textbook/'+ 'student.id.to_s'
    end
  end
end
