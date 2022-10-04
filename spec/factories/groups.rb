FactoryBot.define do
  factory :group do
    association :user
    group        {'group'}
    first_user   {Faker::Name.initials}
    second_user  {Faker::Name.initials}
    third_user   {Faker::Name.initials}
    fourth_user  {Faker::Name.initials}
    fifth_user   {Faker::Name.initials}
    group_since  {'20000101'}
    text         {'コメント'}
  end
end
