class TasksController < ApplicationController
  before_action :set_category

  def index
    @incomplete_tasks = @category.tasks.where(status: :incomplete)
    @completed_tasks = @category.tasks.where(status: :complete)
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    @task.status = :incomplete
    if @task.save
      redirect_to category_tasks_path(@category), notice: 'Task created successfully.'
    else
      render :index
    end
  end

  def complete
    @task = @category.tasks.find(params[:id])
    @task.update(status: :complete)
    redirect_to category_tasks_path(@category), notice: 'Task marked as complete.'
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path(@category), notice: 'Task deleted successfully.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
