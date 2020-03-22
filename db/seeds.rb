# アドミンユーザ

# ダミーユーザ生成
  # 5.times do |n|
  #   name = Faker::Name.name
  #   email = Faker::Internet.email
  #   password = "password"
  #   User.create!(
  #         username: name,
  #         email: email,
  #         password: password,
  #         password_confirmation: password,
  #         )
  # end

  # テストユーザ生成
  password = "password"
  test_user_1 = User.new(
               username: "test_user1",
               email: "test_1@example.com",
               password: password,
               password_confirmation: password,
               )
  test_user_1.skip_confirmation!
  test_user_1.save

  test_user_2 = User.new(
                username: "test_user2",
                email: "test_2@example.com",
                password: password,
                password_confirmation: password,
                )
  test_user_2.skip_confirmation!
  test_user_2.save


  # test_user_1のイベント
  num = 0
  5.times do |n|
    num += 1
    title = Faker::Music.band
    I18n.locale = 'ja'
    address = Gimei.address
    time = Time.new
    @tommorrow_time = time + (60*60*24*1)
    capacity = Faker::Number.within(range: 1..10)

    events_1 = test_user_1.events.build(
               title: title,
               time: @tommorrow_time,
               endtime: @tommorrow_time,
               place: address.kanji,
               capacity: capacity,
               content: "test#{num}",
               image: open("#{Rails.root}/db/fixtures/test01.png")
             )
    events_1.save
  end

  # test_user_2のイベント
  num = 0
  5.times do |n|
    num += 1
    title = Faker::Music.band
    I18n.locale = 'ja'
    address = Gimei.address
    time = Time.new
    @tommorrow_time = time + (60*60*24*1)
    capacity = Faker::Number.within(range: 1..10)

    events_2 = test_user_2.events.build(
               title: title,
               time: @tommorrow_time,
               endtime: @tommorrow_time,
               place: address.kanji,
               capacity: capacity,
               content: "test#{num}",
               image: open("#{Rails.root}/db/fixtures/test01.png")
             )

    events_2.save
  end
