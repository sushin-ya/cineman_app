# メインのサンプルユーザーを1人作成する
User.create!(name: 'Test User',
             email: 'test-0@test.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now,
             description: 'test-0です。無職なので毎日映画を見てます。')

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
               activated_at: Time.zone.now,
               description: "test-#{n + 1}です。無職なので毎日映画を見てます。")
end

# 映画を生成
movies = [
  {
    title: '裏窓',
    production_year: '1954',
    screening_date: '1954/8/1',
    country_of_origin: 'アメリカ',
    screening_time: '112',
    director: 'アルフレッド・ヒッチコック',
    description:
    'カメラマンのジェフは事故で足を骨折し、車椅子生活を余儀なくされる。そんな彼にできる楽しみは、カメラの望遠レンズを使って裏窓から見る隣のアパートの住人達の人間模様の観察であった。
    ある日、いつも口喧嘩が絶えなかった中年夫婦の妻が突如として姿を消す。セールスマンらしい夫の怪しい挙動を観察していたジェフは、数々の状況証拠から殺人事件と確信。恋人リザと共に調査に当たる。事件を認めない友人の刑事を納得させるため、確たる証拠を掴もうとする2人に危機が迫り……。'
  }, {
    title: 'めまい',
    production_year: '1958',
    screening_date: '1958/5/9',
    country_of_origin: 'アメリカ',
    screening_time: '128',
    director: 'アルフレッド・ヒッチコック',
    description:
   '「スコティ」ことジョン・ファーガソン刑事は、犯人を追う途中に同僚を死なせてしまったショックで、高所恐怖症によるめまいに襲われるようになり、警察を辞めてしまう。そこへ学生時代の友人エルスターが現れて、何かに憑かれたかのように不審な行動をする妻マデリンを調査してほしいという。'
  }, {
    title: 'サイコ',
    production_year: '1960',
    screening_date: '1960/6/16',
    country_of_origin: 'アメリカ',
    screening_time: '109',
    director: 'アルフレッド・ヒッチコック',
    description:
   '金曜日の午後、アリゾナ州フェニックスのホテルで、地元の不動産会社のOLのマリオンは恋人サムと情事にふけっている。カリフォルニアで金物店を営むサムは、経済的な理由でマリオンとの再婚に踏み切れずにいる。'
  }, {
    title: '羅生門',
    production_year: '1950',
    screening_date: '1950/8/26',
    country_of_origin: '日本',
    screening_time: '88',
    director: '黒澤明',
    description:
   '平安時代の京の都。羅生門で3人の男たちが雨宿りしていた。そのうちの2人、杣売り(そまうり、焚き木の販売業者)と旅法師はある事件の参考人として出頭した検非違使からの帰途だった。実に奇妙な話を見聞きしたと、もう1人の下人に語り始める。'
  }, {
    title: '用心棒',
    production_year: '1961',
    screening_date: '1961/4/25',
    country_of_origin: '日本',
    screening_time: '110',
    director: '黒澤明',
    description:
   'からっ風が吹きすさぶ中、一人の風来坊の浪人が、桑畑に囲まれた宿場町・馬目宿へとやってくる。
   そこは賭場の元締めである馬目の清兵衛と、清兵衛の部下だったが跡目相続に不服を持って独立した丑寅一家の抗争によって廃れていた。
   2人はそれぞれ町の有力者である名主多左衛門と造酒屋徳右衛門を後見人にし、泥沼化した抗争は終わる気配がなく、町の産業である絹の取引きも中断したままであった。ふらりと立ち寄った居酒屋の権爺からあらましを聞いた浪人は、代金の代わりに馬目宿を平穏にしてやるという。'
  }, {
    title: 'グッドフェローズ',
    production_year: '1990',
    screening_date: '1990/9/19',
    country_of_origin: 'アメリカ',
    screening_time: '145',
    director: 'マーティン・スコセッシ',
    description:
   'ヘンリー・ヒルはアイルランド系の父とシチリア系の母を持ち、物心がついた子供が野球選手や消防士に憧れるように、マフィアの一員になる事を夢見ていた。
   彼は11歳でニューヨーク・ブルックリンのタクシー配車センターでマフィアの使い走りとなり、やがて闇煙草の密売や、偽造クレジットカードの使用などを皮切りに、トラックの荷物強奪や違法賭博・ノミ行為・八百長試合の設定といった犯罪に手を広げていく。'
  }, {
    title: 'カジノ',
    production_year: '1995',
    screening_date: '1995/11/22',
    country_of_origin: 'アメリカ',
    screening_time: '178',
    director: 'マーティン・スコセッシ',
    description:
   '1970年代。予想屋のサム・ロススティーン(通称エース)はその極めて高い的中率によってシカゴマフィアのボス達からも信頼され、ボディガードとして暴力には自信があるニッキーを宛てがわれるほどであった。
   やがてマフィアのボスらは、影響力を持つ全米トラック運転手組合を迂回することで、ラスベガスの巨大カジノ「タンジール」を所有し、その利益を掠め取ることで多額の利益を得ることを決める。
   そこで、ギャンブルを知り尽くした男としてエースを、実質的な運営責任者に据えるのであった。'
  }, {
    title: 'ウルフ・オブ・ウォールストリート',
    production_year: '2013',
    screening_date: '2013/12/25',
    country_of_origin: 'アメリカ',
    screening_time: '179',
    director: 'マーティン・スコセッシ',
    description:
   '22歳で結婚したジョーダン・ベルフォートは、金持ちになる野望を抱きウォール街の投資銀行・LFロスチャイルドに入社。
   そこで風変わりな上司・ハンナとランチを共にし、この世界ではコカインとリラックスが成功する秘訣と教えを受ける。'
  }, {
    title: '劇場版 鬼滅の刃 無限列車編',
    production_year: '2020',
    screening_date: '2020/10/16',
    country_of_origin: '日本',
    screening_time: '117',
    director: '	外崎春雄',
    description:
   '蝶屋敷での修行を終えた炭治郎たちは、次なる任務の地、無限列車に到着する。そこでは、短期間のうちに四十人以上もの人たちが行方不明になっているという。'
  }
]
movies.each do |movie|
  title = movie[:title]
  production_year = movie[:production_year]
  screening_date = movie[:screening_date]
  country_of_origin = movie[:country_of_origin]
  screening_time = movie[:screening_time]
  director = movie[:director]
  description = movie[:description]
  Movie.create!(title: title,
                production_year: production_year,
                screening_date: screening_date,
                country_of_origin: country_of_origin,
                screening_time: screening_time,
                director: director,
                description: description)
end

# 監督を生成
Director.create!(name: 'アルフレッド・ヒッチコック')
Director.create!(name: 'フランソワ・トリュフォー')
Director.create!(name: '黒澤明')
Director.create!(name: 'マーティン・スコセッシ')

# 脚本家を生成
Screenwriter.create!(name: 'アルフレッド・ヒッチコック')
Screenwriter.create!(name: '黒澤明')

# キャスト
Cast.create!(name: 'ジェームズ・ステュアート')
Cast.create!(name: 'キム・ノヴァク')
Cast.create!(name: '三船敏郎')

# ジャンルを生成
Genre.create!(name: 'アニメ')
Genre.create!(name: 'ドラマ')
Genre.create!(name: '恋愛')
Genre.create!(name: 'ホラー')
Genre.create!(name: 'コメディ')
Genre.create!(name: '青春')
Genre.create!(name: 'サスペンス')
Genre.create!(name: 'クライム')

# レビューを生成
user = User.first
movie1 = Movie.first
50.times do |_n|
  user.reviews.create!(
    body: 'これは初めてのレビューです。ちょっと長めに文章を書いてみないとどれくらい表示されるのかわからないです',
    movie_id: movie1.id,
    rate: 1
  )
end

movie2 = Movie.second
user.reviews.create!(body: 'これは二度目のレビューです', movie_id: movie2.id, rate: 2)
movie3 = Movie.find(3)
user.reviews.create!(body: 'これは二度目のレビューです', movie_id: movie3.id, rate: 3)
movie4 = Movie.find(4)
user.reviews.create!(body: 'これは二度目のレビューです', movie_id: movie4.id, rate: 4)
movie5 = Movie.find(5)
user.reviews.create!(body: 'これは二度目のレビューです', movie_id: movie5.id, rate: 5)

# 映画と監督の紐付け
Direction.create!(director_id: 1, movie_id: 1)
Direction.create!(director_id: 1, movie_id: 2)
Direction.create!(director_id: 1, movie_id: 3)
Direction.create!(director_id: 2, movie_id: 4)

# 映画とキャストの紐付け
Appearance.create!(movie_id: 1, cast_id: 1)
Appearance.create!(movie_id: 1, cast_id: 2)
Appearance.create!(movie_id: 5, cast_id: 3)
