FactoryBot.define do
  factory :label do
    name { "リフレッシュ" }
  end
  factory :second_label, class: Label do
    name { "勉強" }
  end
  factory :third_label, class: Label do
  name { "トレーニング" }
  end
end
