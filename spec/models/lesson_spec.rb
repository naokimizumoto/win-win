require 'rails_helper'

RSpec.describe 'Lessonモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { lesson.valid? }

    let!(:lesson) { create(:lesson) }
    let(:lesson) { build(:lesson) }

    context 'homeworkカラム' do
      it '1文字以上であること: 1文字は〇' do
        lesson.homework = Faker::Lorem.characters(number: 1)
        expect(lesson.homework.length).to be >= 1
      end
      it '100文字以下であること: 100文字は〇' do
        lesson.homework = Faker::Lorem.characters(number: 100)
        expect(lesson.homework.length).to be <=100
      end
    end

    context 'notice' do
      it '100文字以下であること: 100文字は〇' do
        lesson.notice = Faker::Lorem.characters(number: 100)
        expect(lesson.notice.length).to be <=100
      end
      it '空欄でないこと' do
        lesson.notice = ''
        is_expected.to eq false
      end
    end

     context 'text_name' do
      it '20文字以下であること: 20文字は〇' do
        lesson.text_name = Faker::Lorem.characters(number: 20)
        expect(lesson.text_name.length).to be <= 20
      end
    end

    context 'feedback' do
      it '100文字以下であること: 100文字は〇' do
        lesson.feedback = Faker::Lorem.characters(number: 100)
        expect(lesson.feedback.length).to be <=100
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'teacherモデルとの関係' do
      it 'N:1となっている' do
        expect(Lesson.reflect_on_association(:teacher).macro).to eq :belongs_to
      end
    end
    context 'studentモデルとの関係' do
      it 'N:1となっている' do
        expect(Lesson.reflect_on_association(:student).macro).to eq :belongs_to
      end
    end
  end
end