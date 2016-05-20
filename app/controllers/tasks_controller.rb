class TasksController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @user = current_user
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @new_task = current_user.tasks.build(task_params)
    @new_task.save
    redirect_to 'tasks#index'
  end

  private
  def task_params
    params.require(:task).permit(:description)
  end
end
