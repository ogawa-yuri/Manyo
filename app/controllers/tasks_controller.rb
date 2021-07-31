class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    if params[:status].present?
     status = params[:status][:name]
    end
    if params[:sort_expired]
      @tasks = Task.all.order(expired_at: :desc)
    elsif params[:task_key].present? && params[:status][:name].present?
      @tasks = Task.where('title LIKE ? and status = ?', "%#{params[:task_key]}%",Task.statuses[status])
    elsif params[:task_key].present? && params[:status][:name].blank?
      @tasks = Task.where('title LIKE ?', "%#{params[:task_key]}%")
    elsif params[:status][:name].present?
      @tasks = Task.where('status = ?',Task.statuses[status])
    else
      @tasks = Task.all.order(created_at: :desc)
    end
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
    @task = Task.new(task_params)
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
    params.require(:task).permit(:title, :content, :expired_at)
  end
  def set_task
    @task = Task.find(params[:id])
  end

end
