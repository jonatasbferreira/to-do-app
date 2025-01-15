class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    if user_signed_in?
      @boards = current_user.boards.all
    end
  end
end
