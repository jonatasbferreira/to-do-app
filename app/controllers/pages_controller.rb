class PagesController < ApplicationController
  def home
    @boards = Board.all
  end
end
