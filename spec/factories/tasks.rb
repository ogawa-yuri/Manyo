FactoryBot.define do
  factory :task do
    title {'散歩'}
    content {'自宅周辺'}
    expired_at {'2021/07/1'}
    status {'waiting'}
    priority {'高'}
  end

  factory :second_task, class: Task do
    title {''}
    content {'test_content2'}
    expired_at {'2021/07/2'}
    status {'completed'}
    priority {'中'}

  end

  factory :third_task, class: Task do
    title {'test_title3'}
    content {''}
    expired_at {'2021/07/3'}
    status {'working'}
    priority {'低'}
  end

  factory :fourth_task, class: Task do
    title {'勉強'}
    content {'プログラミング'}
    expired_at {'2021/07/4'}
    status {'completed'}
    priority {'中'}
  end

  factory :fifth_task, class: Task do
    title {'トレーニング'}
    content {'スクワット'}
    expired_at {'2021/07/5'}
    status {'working'}
    priority {'低'}
  end
end
