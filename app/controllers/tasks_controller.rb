class TasksController < ApplicationController
  before_action :set_board
  before_action :set_list
  before_action :set_task, only: [ :show, :update, :destroy ]

  def index
    @tasks = @list.tasks
    render json: @tasks
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to board_path(@board), notice: "Tarefa criada com sucesso!"
    else
      flash[:alert] = "Erro ao criar a tarefa. Verifique os campos."
      redirect_to board_path(@board)
    end
  end

  def show
    render json: @task
  end

  def update
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to board_path(@board), notice: "Tarefa atualizada com sucesso!"
    else
      flash[:alert] = "Erro ao atualizar a tarefa. Verifique os campos."
      redirect_to board_path(@board)
    end
  end

  def destroy
    if @task.destroy
      redirect_to board_path(@board), notice: "Tarefa deletada com sucesso!"
    else
      redirect_to board_path(@board), notice: "Erro ao deleta a tarefa."
    end
  end

  def move
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

    new_list_id = params[:new_list_id]
    new_list = List.find(new_list_id)

    if @task.update(list: new_list)
      redirect_to board_path(@board), notice: "Tarefa movida com sucesso!"
    else
      flash.now[:alert] = "Erro ao mover a tarefa."
    end
  end

  def check
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])

    if @task.update(done: !@task.done)
      redirect_to board_path(@board), notice: "Tarefa marcada com sucesso!"
    else
      redirect_to board_path(@board), notice: "Erro ao marcar tarefa."
    end
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
