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

 PostSneaker.create!(post_sneaker_id: 1,
  user_id: 1,
  sneakers_name: "エアフォース1",
  post_image: File.open("./app/assets/images/エアフォースワン.jpeg"),
  caption: "ナイキエアフォース1 ロー07 'ホワイト'(2020)",
  gender_selection: 0)

 PostSneaker.create!(post_sneaker_id: 2,
  user_id: 1,
  sneakers_name: "コンバース オールスター",
  post_image: File.open("./app/assets/images/コンバース.jpeg"),
  caption: "オールスター 100 デジタルビット ＨＩ",
  gender_selection: 1)