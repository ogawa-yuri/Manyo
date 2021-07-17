class TasksController < ApplicationController
  def show
    params[:id]
  end

  def index
    @tasks = Task.all
  end
end
