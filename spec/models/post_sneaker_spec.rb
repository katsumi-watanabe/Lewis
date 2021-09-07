# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe PostSneaker, aliases: [:post_sneaker],  type: :model do
#   describe 'モデルのテスト' do
#   it "有効な投稿内容の場合は保存されるか" do
#     expect(FactoryBot.build(:post_sneaker)).to be_valid
#   end

#     context "nameカラム" do
#       it '空欄であればエラーメッセージがかえる' do
#         post_sneaker = build(:post_sneaker, sneakers_name: nil)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:sneakers_name]).to include("を入力してください")
#       end

#       it '30文字を越えたらエラーメッセージ' do
#         post_sneaker = create(:post_sneaker)
#         post_sneaker.name = Faker::Lorem.characters(number: 30)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:sneakers_name]).to include("は30文字以内で入力してください")
#       end
#     end

#     context "imageカラム" do
#       it "空欄であればエラーメッセージがかえる" do
#         post_sneaker = build(:post_sneaker, post_image_id: nil)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:post_image_id]).to include("を選択してください")
#       end
#     end

#     context "selectionカラム" do
#       it "空欄であればエラーメッセージがかえる" do
#         post_sneaker = build(:post_sneaker, gender_selection: nil)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:gender_selection]).to include("を選択してください")
#       end
#     end

#     context "captionカラム" do
#       it '空欄であればエラーメッセージがかえる' do
#         post_sneaker = build(:post_sneaker, caption: nil)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:caption]).to include("を入力してください")
#       end

#       it '1文字以上でOK' do
#         post_sneaker = create(:post_sneaker)
#         post_sneaker.caption = Faker::Lorem.characters(number: 1)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:caption]).to include("は1文字以上で入力してください")
#       end

#       it '90文字を越えたらエラーメッセージ' do
#         post_sneaker = create(:post_sneaker)
#         post_sneaker.caption = Faker::Lorem.characters(number: 90)
#         post_sneaker.valid?
#         expect(post_sneaker.errors[:caption]).to include("は90文字以内で入力してください")
#       end
#     end
#   end
# end