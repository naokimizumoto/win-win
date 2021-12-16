require 'rails_helper'

RSpec.describe 'Studentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { student.valid? }

    let!(:other_student) { create(:student) }
    let(:student) { build(:student) }

    context 'nameカラム' do
      it '空欄でないこと' do
        student.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        student.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        student.name= Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
    end

    context 'name_kana' do
      it '20文字以下であること: 20文字は〇' do
        student.name= Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
    end

    context 'number' do
      it '10文字以下であること: 10文字は〇' do
        student.number = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '空欄でないこと' do
        student.number = ''
        is_expected.to eq false
      end
    end

  describe 'アソシエーションのテスト' do
    context 'lessonモデルとの関係' do
      it '1:Nとなっている' do
        expect(Student.reflect_on_association(:lessons).macro).to eq :has_many
      end
    end
    context 'textbook_studentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Student.reflect_on_association(:textbook_students).macro).to eq :has_many
      end
    end
  end
end