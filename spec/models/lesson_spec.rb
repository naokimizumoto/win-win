require 'rails_helper'

RSpec.describe 'Lessonモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { lesson.valid? }

    let!(:other_lesson) { create(:lesson) }
    let(:lesson) { build(:lesson) }

    context 'homeworkカラム' do
      it '2文字以上であること: 2文字は〇' do
        lesson.homework = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '100文字以下であること: 100文字は〇' do
        lesson.homework = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
    end

    context 'notice' do
      it '100文字以下であること: 100文字は〇' do
        lesson.notice = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
      it '空欄でないこと' do
        lesson.notice = ''
        is_expected.to eq false
      end
    end

     context 'text_name' do
      it '20文字以下であること: 20文字は〇' do
        lesson.text_name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
    end

    context 'feedback' do
      it '100文字以下であること: 100文字は〇' do
        lesson.feedbadk = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
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