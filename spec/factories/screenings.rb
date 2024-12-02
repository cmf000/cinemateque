FactoryBot.define do
  factory :screening do
    movie { nil }
    room { nil }
    weekday { 1 }
    start_time { "2024-12-02 10:05:06" }
  end
end
