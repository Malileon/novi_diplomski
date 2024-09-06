class Topic < ApplicationRecord
  has_many :quizzes, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # Broadcasting changes in 2 browsers
  broadcasts_to ->(topic) { "topics" }, inserts_by: :prepend
end
