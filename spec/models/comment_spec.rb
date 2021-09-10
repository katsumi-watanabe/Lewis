require 'rails_helper'

RSpec.describe Comment,  type: :model do
  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:comment)).to be_valid
    end

  context "commentカラム" do
    it "空欄であれば保存されない" do
      comment = build(:comment, comment: nil)
      comment.valid?
      expect(comment.valid?).to eq false
    end

    # it "100字以上だとエラーが表示される" do
    #   comment = create(:comment)
    #   comment = Faker::Lorem.characters(number: 101)
    #   comment.valid?
    #   expect(comment.errors[:comment]).to include("は100文字以内で入力してください")
    # end
  end

  end
end