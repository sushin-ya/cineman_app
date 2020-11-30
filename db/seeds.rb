# メインのサンプルユーザーを1人作成する
User.create!(name: 'Test User',
             email: 'test-0@test.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "test-#{n + 1}@test.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
