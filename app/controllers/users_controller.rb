class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
    redirect_to tasks_path if current_user.present?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # redirect_to tasks_path
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
    redirect_to tasks_path unless @user == current_user
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
end
