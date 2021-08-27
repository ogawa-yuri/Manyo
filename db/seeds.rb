# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
   {
     name: "管理",
     email: "admin2@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: true
   },
   {
     name: "hana",
     email: "hana@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "nana",
     email: "nana@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "rina",
     email: "rina@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "rino",
     email: "rino@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "sana",
     email: "sena@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "mana",
     email: "mana@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "rin",
     email: "rin@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "nene",
     email: "nene@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   },
   {
     name: "nano",
     email: "nano@example.com",
     password: "q123456789@",
     password_confirmation: "q123456789@",
     admin: false
   }
 ]
)

label_names = ["仕事", "トレーニング", "趣味", "勉強", "掃除", "読書", "睡眠", "ジム", "英語", "プログラミング"]
label_names.each do |label_name|
  Label.create!(label: label_name)
end


(1..10).each do |i|
Task.create!(
  [
    {
      title: '洗濯',
      content: '洗濯する',
      expired_at: '2021-01-01'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      title: '筋トレ',
      content: '筋トレする',
      expired_at: '2021-08-02'.to_date,
      status: '着手中',
      priority: '中',
      user_id: "#{i}"
    },
    {
      title: '布団干し',
      content: '布団を干す',
      expired_at: '2021-06-03'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      title: 'ゴミ出し',
      content: 'ゴミ出しをする',
      expired_at: '2021-12-04'.to_date,
      status: '未着手',
      priority: '中',
      user_id: "#{i}"
    },
    {
      title: 'お風呂',
      content: 'サウナ',
      expired_at: '2021-11-05'.to_date,
      status: '着手中',
      priority: '低',
      user_id: "#{i}"
    },
    {
      title: '洗濯物',
      content: 'アイロンする',
      expired_at: '2020-07-06'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    },
    {
      title: '料理',
      content: '料理する',
      expired_at: '2020-03-07'.to_date,
      status: '未着手',
      priority: '中',
      user_id: "#{i}"
    },
    {
      title: '勉強',
      content: '勉強する',
      expired_at: '2020-06-08'.to_date,
      status: '着手中',
      priority: '高',
      user_id: "#{i}"
    },
    {
      title: '散歩',
      content: '家の近くを散歩する',
      expired_at: '2020-05-09'.to_date,
      status: '着手中',
      priority: '低',
      user_id: "#{i}"
    },
    {
      title: 'トレーニング',
      content: '筋トレをする',
      expired_at: '2020-02-10'.to_date,
      status: '完了',
      priority: '高',
      user_id: "#{i}"
    }
  ]
)
end
