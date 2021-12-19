require 'rails_helper'

RSpec.describe 'Textbookモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { textbook.valid? }

    let!(:textbook) { create(:textbook) }
    let(:textbook) { build(:textbook) }

    context 'nameカラム' do
      it '2文字以上であること: 2文字は〇' do
        textbook.name = Faker::Lorem.characters(number: 2)
        expect(textbook.name.length).to be >= 2
      end
      it '100文字以下であること: 100文字は〇' do
        textbook.name = Faker::Lorem.characters(number: 100)
       expect(textbook.name.length).to be <= 100
      end
      it '空欄でないこと' do
        textbook.name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'textbook_studentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Textbook.reflect_on_association(:textbook_students).macro).to eq :has_many
      end
    end
  end
end