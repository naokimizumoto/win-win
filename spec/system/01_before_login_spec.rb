require 'rails_helper'

describe '[STEP1] 生徒ログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'Log inリンクが表示される: 青色のボタンの表示が「Log in」である' do
        log_in_link = find_all('a')[5].native.inner_text
        expect(log_in_link).to match(/Log in/)
      end
      it 'Log inリンクの内容が正しい' do
        log_in_link = find_all('a')[5].native.inner_text
        expect(page).to have_link log_in_link, href: new_student_session_path
      end
    end
  end

  # describe '生徒ログイン' do
  #   let(:student) { create(:student) }

  #   before do
  #     visit new_student_session_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい' do
  #       expect(current_path).to eq '/students/sign_in'
  #     end
  #     it '「Log in」と表示される' do
  #       expect(page).to have_content 'Log in'
  #     end
  #     it 'nameフォームが表示される' do
  #       expect(page).to have_field 'student[name]'
  #     end
  #     it 'numberフォームが表示される' do
  #       expect(page).to have_field 'student[number]'
  #     end
  #     it 'emailフォームが表示される' do
  #       expect(page).to have_field 'student[email]'
  #     end
  #     it 'passwordフォームが表示される' do
  #       expect(page).to have_field 'student[password]'
  #     end
  #     it 'password_confirmationフォームが表示される' do
  #       expect(page).to have_field 'student[password_confirmation]'
  #     end
  #   end

  #   context 'ログイン成功のテスト' do
  #     before do
  #       fill_in 'student[name]', with: student.name
  #       fill_in 'student[password]', with: student.password
  #       fill_in 'student[number]', with: student.number
  #       fill_in 'student[email]', with: student.email
  #       click_button 'Log in'
  #     end

  #     it 'ログイン後のリダイレクト先が、ログインして生徒のトップページになっている' do
  #       expect(current_path).to eq '/'
  #     end
  #   end

  #   context 'ログイン失敗のテスト' do
  #     before do
  #       fill_in 'student[name]', with: ''
  #       fill_in 'student[password]', with: ''
  #       fill_in 'student[number]', with: ''
  #       fill_in 'student[email]', with: ''
  #       click_button 'Log in'
  #     end

  #     it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
  #       expect(current_path).to eq '/students/sign_in'
  #     end
  #   end
  # end

  # describe 'ヘッダーのテスト: ログインしている場合' do
  #   let(:student) { create(:student) }

  #   before do
  #     fill_in 'student[name]', with: student.name
  #     fill_in 'student[password]', with: student.password
  #     fill_in 'student[number]', with: student.number
  #     fill_in 'student[email]', with: student.email
  #     click_button 'Log in'
  #   end

  #   context 'ヘッダーの表示を確認' do
  #     it 'win-winリンクが表示される: 左上から1番目のリンクが「win-win」である' do
  #       home_link = find_all('a')[0].native.inner_text
  #       expect(home_link).to match(/win-win/)
  #     end
  #     it '授業一覧リンクが表示される: 左上から2番目のリンクが「授業一覧」である' do
  #       lessons_link = find_all('a')[1].native.inner_text
  #       expect(lessons_link).to match(/授業一覧/)
  #     end
  #     it '教材一覧リンクが表示される: 左上から3番目のリンクが「教材一覧」である' do
  #       textbooks_link = find_all('a')[2].native.inner_text
  #       expect(textbooks_link).to match(/教材一覧/)
  #     end
  #     it 'Log outリンクが表示される: 左上から4番目のリンクが「ログアウト」である' do
  #       logout_link = find_all('a')[4].native.inner_text
  #       expect(logout_link).to match(/ログアウト/)
  #     end
  #   end
  # end

  # describe '生徒ログアウトのテスト' do
  #   let(:student) { create(:student) }

  #   before do
  #     visit new_student_session_path
  #     fill_in 'student[name]', with: student.name
  #     fill_in 'student[password]', with: student.password
  #     click_button 'Log in'
  #     logout_link = find_all('a')[4].native.inner_text
  #     logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #     click_link logout_link
  #   end

  #   context 'ログアウト機能のテスト' do
  #     it '正しくログアウトできている: ログアウト後のリダイレクト先においてログイン画面へのリンクが存在する' do
  #       expect(page).to have_link 'Log in', href: '/students/sign_in'
  #     end
  #     it 'ログアウト後のリダイレクト先が、トップになっている' do
  #       expect(current_path).to eq '/'
  #     end
  #   end
  # end

# describe '[STEP1] 講師ログイン前のテスト' do

#   describe '講師ログイン' do
#     let(:teacher) { create(:teacher) }

#     before do
#       visit new_teacher_session_path
#     end

#     context '表示内容の確認' do
#       it 'URLが正しい' do
#         expect(current_path).to eq '/teachers/sign_in'
#       end
#       it '「Log in」と表示される' do
#         expect(page).to have_content 'Log in'
#       end
#       it 'nameフォームが表示される' do
#         expect(page).to have_field 'teacher[name]'
#       end
#       it 'emailフォームが表示される' do
#         expect(page).to have_field 'teacher[email]'
#       end
#       it 'passwordフォームが表示される' do
#         expect(page).to have_field 'teacher[password]'
#       end
#     end

#     context 'ログイン成功のテスト' do
#       before do
#         fill_in 'teacher[name]', with: teacher.name
#         fill_in 'teacher[password]', with: teacher.password
#         fill_in 'teacher[email]', with: teacher.email
#         click_button 'Log in'
#       end

#       it 'ログイン後のリダイレクト先が、ログインして講師のトップページになっている' do
#         expect(current_path).to eq 'teacher_path'
#       end
#     end

#     context 'ログイン失敗のテスト' do
#       before do
#         fill_in 'teacher[name]', with: ''
#         fill_in 'teacher[password]', with: ''
#         fill_in 'teacher[email]', with: ''
#         click_button 'Log in'
#       end

#       it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
#         expect(current_path).to eq '/teachers/sign_in'
#       end
#     end
#   end

#   describe 'ヘッダーのテスト: ログインしている場合' do
#     let(:teacher) { create(:teacher) }

#     before do
#       fill_in 'teacher[name]', with: teacher.name
#       fill_in 'teacher[password]', with: teacher.password
#       fill_in 'teacher[email]', with: teacher.email
#       click_button 'Log in'
#     end

#     context 'ヘッダーの表示を確認' do
#       it 'win-winリンクが表示される: 左上から1番目のリンクが「win-win」である' do
#         win_win_link = find_all('a')[0].native.inner_text
#         expect(win_win_link).to match(/win-win/)
#       end
#       it '授業一覧リンクが表示される: 左上から2番目のリンクが「授業一覧」である' do
#         lessons_link = find_all('a')[1].native.inner_text
#         expect(lessons_link).to match(/授業一覧/)
#       end
#       it '教材一覧リンクが表示される: 左上から3番目のリンクが「教材一覧」である' do
#         textbooks_link = find_all('a')[2].native.inner_text
#         expect(textbooks_link).to match(/教材一覧/)
#       end
#       it 'Log outリンクが表示される: 左上から4番目のリンクが「ログアウト」である' do
#         logout_link = find_all('a')[4].native.inner_text
#         expect(logout_link).to match(/ログアウト/)
#       end
#     end
#   end

#   describe '講師ログアウトのテスト' do
#     let(:teacher) { create(:teacher) }

#     before do
#       visit new_teacher_session_path
#       fill_in 'teacher[name]', with: teacher.name
#       fill_in 'teacher[password]', with: teacher.password
#       click_button 'Log in'
#       logout_link = find_all('a')[4].native.inner_text
#       logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
#       click_link logout_link
#     end

#     context 'ログアウト機能のテスト' do
#       it 'ログアウト後のリダイレクト先が、トップになっている' do
#         expect(current_path).to eq '/'
#       end
#     end
#   end

end