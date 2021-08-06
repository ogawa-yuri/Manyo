class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum status: { waiting: 0, working: 1, completed: 2 }

  scope :expired_at_sort, ->{order(expired_at: :desc)}
  # scope :status_search, ->(status){where('status = ?', statuses(:status)}

  scope :status_search, -> (status) {
    where(status: status)
  }

  scope :title_search, -> (title) {
    where("title LIKE ?", "%#{ title }%")
  }

  # scope :title_search, ->(task_key){where('title LIKE ?',task_key)}
end
