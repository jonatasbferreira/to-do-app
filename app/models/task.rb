class Task < ApplicationRecord
  belongs_to :list

  validates :title, :priority, presence: true

  enum :priority, [ :baixa, :media, :alta ]
  attribute :done, :boolean, default: false

  def mark_as_done
    update(done: true)
  end
end
