class ListsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @list = @board.lists.build(name: "Nova Lista")
    if @list.save
      redirect_to board_path(@board), notice: "Lista criada com sucesso!"
    else
      @lists = List.all
      flash.now[:alert] = "Erro ao criar a lista. Verifique os campos."
      redirect_to board_path(@board)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end