class DetailTasksController < ApplicationController
  def create
    @detail_task = DetailTask.new(detail_task_params)
    if @detail_task.save
      redirect_to "/task_categories/#{detail_task.task_category.id}"
    else
      @task_category = @detail_task.task_category
      @detail_tasks = @task_category.detail_tasks
      render "task_categories/show"
    end
  end
  private
  def detail_task_params
    params.require(:detail_task)
    .permit(:title, :description, :deadline, :state_id,:user_id).merge(user_id: current_user.id)
  end
end
