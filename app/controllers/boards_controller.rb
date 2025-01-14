class BoardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @boards = current_user.boards
  end

  def show
    @board = current_user.boards.find(params[:id])
    @lists = @board.lists
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path, notice: "Quadro criado com sucesso!"
    else
      @boards = Board.all
      redirect_to root_path, notice: "Erro ao criar o quadro. Verifique os campos."
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    if @board.destroy
      redirect_to root_path, notice: "Quadro deletado com sucesso!"
    else
      redirect_to root_path, alert: "Erro ao deletar o quadro."
    end
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: "Quadro atualizado com sucesso!"
    else
      flash.now[:alert] = "Erro ao atualizar o quadro. Verifique os campos."
      redirect_to root_path
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end