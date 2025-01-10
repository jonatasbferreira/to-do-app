class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  validates :name, presence: true

  after_create :add_default_lists

  private
  def add_default_lists
    lists.create([ { name: "A Fazer" }, { name: "Fazendo" }, { name: "Feito" } ])
  end
end
