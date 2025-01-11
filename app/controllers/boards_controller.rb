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

  private

  def board_params
    params.require(:board).permit(:name)
  end
end