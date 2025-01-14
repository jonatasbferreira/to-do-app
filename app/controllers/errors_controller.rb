class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render status: :not_found }
      format.json { render json: { error: "Página não encontrada" }, status: :not_found }
    end
  end
end
