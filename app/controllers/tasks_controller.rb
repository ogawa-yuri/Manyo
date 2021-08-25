class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :get_labels, only: [:new, :edit]
  def show
    @labels = @task.labels
  end

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
    @tasks = @tasks.expired_at_sort if params[:sort_expired].present?
    @tasks = @tasks.status_search(params[:status]) if params[:status].present?
    @tasks = @tasks.title_search(params[:title]) if params[:title].present?
    @tasks = @tasks.priority_sort if params[:sort_priority].present?
    @tasks = @tasks.page(params[:page]).per(10)
    # binding.irb
    # @tasks = labels.label_serch(params[:label_id]).present?
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    # @tasks = @tasks.label_serch(params[:label_id]) if params[:label_id].present?
    # if params[:status].present?
    #  status = params[:status][:name]
    # end

    # if params[:sort_expired].present?
      # @tasks = Task.all.order(expired_at: :desc)
    #   @tasks = Task.all.expired_at_sort
    # elsif params[:task_key].present? && params[:status][:name].present?
    #   @tasks = Task.status_search(status)
    #   @tasks = Task.where('title LIKE ? and status = ?', "%#{params[:task_key]}%",Task.statuses[status])
    # elsif params[:task_key].present? && params[:status][:name].blank?
    #   @tasks = Task.where('title LIKE ?', "%#{params[:task_key]}%")
    # elsif params[:status][:name].present? && params[:task_key].blank?
    #   @tasks = Task.where('status = ?',Task.statuses[status])
    # else
    #   @tasks = Task.all.order(created_at: :desc)
    # end
  end
  # params[:task_key].blank? && params[:status][:name].present?

    # if for content_ty
    # respond_to do |format|
    #   form.html {
    #
    #   }
    #   form.js {
    #   }
    # end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice:"タスクを作成しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice:"タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :expired_at, :status, :priority, label_ids: [])
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def get_labels
    @labels = Label.all
  end
end
