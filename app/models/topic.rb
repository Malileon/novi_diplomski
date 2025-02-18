class Topic < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  has_one_attached :picture

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(topic) { "topics" }, inserts_by: :prepend
end
