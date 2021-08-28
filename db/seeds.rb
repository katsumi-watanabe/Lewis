# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@admin.com",
 password: "admins",
 id: 1)

User.create!(email: "user@user.com",
 name: "user",
 password: "userss",
 introduction: "スニーカーの写真を投稿します。よろしくお願いします！",
 profile_image: File.open("./app/assets/images/pagu.jpeg"),
 id: 1)

 PostSneaker.create!(id: 1,
  user_id: 1,
  sneakers_name: "エアフォース1",
  post_image: File.open("./app/assets/images/seed-image/エアフォース1.jpeg"),
  caption: "人気のナイキエアフォース1 普段履き用での購入大切に履きます！",
  gender_selection: 0)

 PostSneaker.create!(id: 2,
  user_id: 1,
  sneakers_name: "エアジョーダン1",
  post_image: File.open("./app/assets/images/seed-image/エアジョーダン1.jpg"),
  caption: "エアジョーダン1 ハイ OG GS お気に入りのスニーカー",
  gender_selection: 1)

 PostSneaker.create!(id: 3,
  user_id: 1,
  sneakers_name: "コンバース オールスター",
  post_image: File.open("./app/assets/images/seed-image/コンバース.jpeg"),
  caption: "オールスター",
  gender_selection: 1)

 PostSneaker.create!(id: 4,
  user_id: 1,
  sneakers_name: "アシックス Gel-Lyte 5",
  post_image: File.open("./app/assets/images/seed-image/アシックス.jpg"),
  caption: "アシックス Gel-Lyte 5",
  gender_selection: 1)


 PostSneaker.create!(id: 5,
  user_id: 1,
  sneakers_name: "アディダス Iniki",
  post_image: File.open("./app/assets/images/seed-image/アディダス.jpg"),
  caption: "アディダス Iniki ランニングシューズ用で購入！今日からお世話になります",
  gender_selection: 0)

 PostSneaker.create!(id: 6,
  user_id: 1,
  sneakers_name: "ナイキダンクロー",
  post_image: File.open("./app/assets/images/seed-image/ナイキダンクlow.jpg"),
  caption: "ナイキダンクロー my collection",
  gender_selection: 0)
