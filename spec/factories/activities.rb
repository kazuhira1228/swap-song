FactoryBot.define do
  factory :activity do
    association :user
    group         {'group'}
    activity_day  {'20000101'}
    song          {'練習曲'}
    studio        {'練習場所'}
    text          {'コメント'}
  end
end