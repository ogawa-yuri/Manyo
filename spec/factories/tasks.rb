FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title' }
    content { 'test_content' }
  end

  factory :second_task, class: Task do
    title {'second_task_title'}
    content {'second_task_content'}
  end
end
