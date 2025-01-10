class TasksController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_task, only: [ :show, :update, :destroy ]

  # GET /boards/:board_id/lists/:list_id/tasks
  def index
    @tasks = @list.tasks
    render json: @tasks
  end

  # POST /boards/:board_id/lists/:list_id/tasks
  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # GET /boards/:board_id/lists/:list_id/tasks/:id
  def show
    render json: @task
  end

  # PATCH/PUT /boards/:board_id/lists/:list_id/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/:board_id/lists/:list_id/tasks/:id
  def destroy
    @task.destroy
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = @board.lists.find(params[:list_id])
  end

  def set_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :priority, :due_date, :done)
  end
end
