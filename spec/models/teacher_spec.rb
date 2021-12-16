require 'rails_helper'

RSpec.describe 'Teacherモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { teacher.valid? }

    let!(:other_teacher) { create(:teacher) }
    let(:teacher) { build(:teacher) }

    context 'nameカラム' do
      it '2文字以上であること: 2文字は〇' do
        teacher.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '100文字以下であること: 100文字は〇' do
        teacher.name = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
      it '空欄でないこと' do
        teacher.name = ''
        is_expected.to eq false
      end
    end

  describe 'アソシエーションのテスト' do
    context 'lessonモデルとの関係' do
      it '1:Nとなっている' do
        expect(Teacher.reflect_on_association(:lessons).macro).to eq :has_many
      end
    end
  end
end