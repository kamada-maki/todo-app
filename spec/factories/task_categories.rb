FactoryBot.define do
  factory :task_category do
    title           { 'テスト投稿' }
    user_id         { 2 }
    description     { Faker::Lorem.sentence(1..30) }
    deadline        {Faker::Date.backward}
    state_id        { 2 }
    association :user
  end
end
