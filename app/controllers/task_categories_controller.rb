class TaskCategoriesController < ApplicationController
  before_action :set_task_category, only: [:show, :edit, :update, :destroy]
  def index
    @task_categories = TaskCategory.all
    @user = User.new
    @users = User.all
  end

  def new
    @task_category = TaskCategory.new
    @user = User.new
    @users = User.all
  end

  def create
    @task_category = TaskCategory.new(task_category_params)
    @users = User.all
    if @task_category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @detail_task = DetailTask.new
    @detail_tasks = @task_category.detail_tasks
  end

  def edit
  end

  def update
    if @task_category.update(task_category_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @task_category.destroy
    redirect_to root_path
  end

  private

  def task_category_params
    params.require(:task_category)
          .permit(:title, :description, :deadline, :state_id, :user_id).merge(user_id: current_user.id)
  end

  def set_task_category
    @task_category = TaskCategory.find(params[:id])
  end
end
