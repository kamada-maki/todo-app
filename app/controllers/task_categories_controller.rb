class TaskCategoriesController < ApplicationController
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
    @task_category=TaskCategory.new(task_category_params)
    @users = User.all
      if @task_category.save
        render :index
      else
        render :new
      end
  end
  def edit
  end
  def update
    if @task_category.update(task_category_params)
      render :index
    else
      render :edit
    end
  end
  def destroy
    @task_category.destroy
    render :index
  end
  private
  def task_category_params
    params.require(:task_category)
          .permit(:title, :description, :deadline, :state_id).merge(user_id: current_user.id)
  end
end
