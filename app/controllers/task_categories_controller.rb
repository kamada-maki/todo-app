class TaskCategoriesController < ApplicationController
  def index
    @task_categories = TaskCategory.all
  end
  def new
    @task_category = TaskCategory.new
    @user = User.new
    @users = User.all
  end
  def create
    @task_category=TaskCategory.new(task_category_params)
    @users = User.all
      if @task_category.save
        render :index
      else
        render :new
      end
  end
  private

  def task_category_params
    params.require(:task_category)
          .permit(:title, :description, :deadline, :state_id).merge(user_id: current_user.id)
  end
end
