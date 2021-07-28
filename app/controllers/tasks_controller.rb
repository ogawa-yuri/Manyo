class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    # if params[:status].present?
    #   p params[:status][:name]
    # end
    p params[:status][:name] if params[:status].present?
    if params[:sort_expired]
      @tasks = Task.all.order(expired_at: :desc)
    elsif params[:task_key].present? && params[:status].present?
      @tasks = Task.where('title LIKE ? and status = ?', "%#{params[:task_key]}%", "#{params[:status][:name]}")
    elsif params[:task_key].present? && params[:status].empty?
      @tasks = Task.where('title LIKE ?' "%#{params[:task_key]}%")
    elsif params[:task_key].nil? && params[:status].present?
      @tasks = Task.where('title = ?' "#{params[:status][:name]}")
    else
      @tasks = Task.all.order(created_at: :desc)
    end

    # if for content_ty
    # respond_to do |format|
    #   form.html {
    #
    #   }
    #   form.js {
    #   }
    # end
  end

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
