require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  context 'nameカラム' do
    it '空欄であればエラーメッセージがかえる' do
      @user = build(:user, name: nil)
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it 'name10文字を越えたらエラーメッセージ' do
      @user = create(:user)
      @user.name = Faker::Lorem.characters(number: 11)
      @user.valid?
      expect(@user.errors[:name]).to include("は10文字以内で入力してください")
    end
  end

  context 'emailカラム' do
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "emailに一意性がないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  end

    context 'introductionカラム' do
    it '50文字を越えたらエラーメッセージ' do
      @user = create(:user)
      @user.introduction = Faker::Lorem.characters(number: 51)
      @user.valid?
      expect(@user.errors[:introduction]).to include("は50文字以内で入力してください")
    end
  end
 end
end