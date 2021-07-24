FactoryBot.define do
  factory :task do
    title {'test_title'}
    content {'test_content'}
    expired_at {'2021/07/1'}
  end

  factory :second_task, class: Task do
    title {''}
    content {'test_content2'}
    expired_at {'2021/07/2'}

  end

  factory :third_task, class: Task do
    title {'test_title3'}
    content {''}
    expired_at {'2021/07/3'}
  end

  factory :fourth_task, class: Task do
    title {'test_title4'}
    content {'test_content4'}
    expired_at {'2021/07/4'}
  end

  factory :fifth_task, class: Task do
    title {'test_title5'}
    content {'test_content5'}
    expired_at {'2021/07/5'}
  end
end
