FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sex_id                {Faker::Number.between(from: 2, to: 4)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    city                  {'市区町村名'}
    holiday_id            {Faker::Number.between(from: 2, to: 4)}
    member_since          {'20000101'}
    favorite_part         {'パート名'}
    favorite_singer       {'歌手名'}
    group                 {'group'}
    more_join_id          {Faker::Number.between(from: 2, to: 3)}
  end
end
