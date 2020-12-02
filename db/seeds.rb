# メインのサンプルユーザーを1人作成する
User.create!(name: 'Test User',
             email: 'test-0@test.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name = Faker::Name.name
  email = "test-#{n + 1}@test.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# 映画を生成
10.times do |n|
  title = Faker::Movie.title
  production_year = rand(1950..2020)
  screening_date = Faker::Date.between(from: '1940-01-01', to: '2020-12-31')
  country_of_origin = (n % 2).zero? ? '日本' : 'アメリカ'
  screening_time = rand(60..120)
  director = Faker::Name.name
  sentences = Faker::Lorem.sentences(number: 10)
  description = ''
  sentences.each do |s|
    description += s
  end
  Movie.create!(title: title,
                production_year: production_year,
                screening_date: screening_date,
                country_of_origin: country_of_origin,
                screening_time: screening_time,
                director: director,
                description: description)

  Director.create!(name: director)
end

# ジャンルを生成
10.times do |_n|
  genre = Faker::Book.genre
  Genre.create!(name: genre)
end
