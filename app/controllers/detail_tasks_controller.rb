class DetailTasksController < ApplicationController
  def create
    @task_category=TaskCategory.find(params[:task_category_id])
    @detail_task = DetailTask.new(detail_task_params)
    if @detail_task.save
      redirect_to task_category_path(@detail_task.task_category)
    else
      @task_category = @detail_task.task_category
      @detail_tasks = @task_category.detail_tasks
      render "task_categories/show"
    end
  end
  def destroy
  end
  def edit
  end
  private
  def detail_task_params
    params.require(:detail_task)
    .permit(:title, :description, :deadline, :state_id,:user_id).merge(user_id: current_user.id,task_category_id: params[:task_category_id])
  end
end
