class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.includes(:tasks).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザーを登録しました"
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザーを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザーを削除しました"
  end

  private
  def admin_user
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
