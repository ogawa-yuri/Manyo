FactoryBot.define do
  factory :task do
    title {'test_title'}
    content {'test_content'}
  end

  factory :second_task, class: Task do
    title {''}
    content {'test_content2'}
  end

  factory :third_task, class: Task do
    title {'test_title3'}
    content {''}
  end

  factory :fourth_task, class: Task do
    title {'test_title4'}
    content {'test_content4'}
  end

  factory :fifth_task, class: Task do
    title {'test_title5'}
    content {'test_content5'}
  end
end
