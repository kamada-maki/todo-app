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
    @task_category=TaskCategory.find(params[:id])
  end
  def update
    @task_category=TaskCategory.find(params[:id])
    if @task_category.update(task_category_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @task_category=TaskCategory.find(params[:id])
    @task_category.destroy
    redirect_to root_path
  end
  private
  def task_category_params
    params.require(:task_category)
          .permit(:title, :description, :deadline, :state_id,:user_id).merge(user_id: current_user.id)
  end
end
