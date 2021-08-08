class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum status: { waiting: 0, working: 1, completed: 2 }
  enum priority: { "高": 0, "中": 1, "低": 2 }

  scope :expired_at_sort, -> {reorder(expired_at: :desc)}
  # scope :status_search, ->(status){where('status = ?', statuses(:status)}
  scope :priority_sort, -> {reorder(priority: :asc)}

  scope :status_search, -> (status) {
    where(status: status)
  }

  scope :title_search, -> (title) {
    where("title LIKE ?", "%#{ title }%")
  }

  # scope :title_search, ->(task_key){where('title LIKE ?',task_key)}
end
