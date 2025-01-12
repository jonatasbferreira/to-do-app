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

  def update
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])

    if @list.update(list_params)
      redirect_to board_path(@board), notice: "Lista atualizada com sucesso!"
    else
      flash[:alert] = "Erro ao atualizar a lista. Verifique os campos."
      redirect_to board_path(@board)
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:id])

    if @list.destroy
      redirect_to board_path(@board), notice: "Lista deletada com sucesso!"
    else
      redirect_to board_path(@board), alert: "Erro ao deletar a lista."
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end