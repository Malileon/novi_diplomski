class TextInputQuestion < ApplicationRecord
  include Questionable
  belongs_to :quiz

  validates :question_text, presence: true
  validates :answer, presence: true

  scope :ordered, -> { order(created_at: :asc) }
end
