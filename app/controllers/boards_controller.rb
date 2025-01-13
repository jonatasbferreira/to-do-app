class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @lists = @board.lists
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path, notice: "Quadro criado com sucesso!"
    else
      @boards = Board.all
      flash.now[:alert] = "Erro ao criar o quadro. Verifique os campos."
      render :index
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      redirect_to root_path, notice: "Quadro deletado com sucesso!"
    else
      redirect_to root_path, alert: "Erro ao deletar o quadro."
    end
  end

  def update
    @board = Board.find(params[:id])
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