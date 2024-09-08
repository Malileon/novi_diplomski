class Choice < ApplicationRecord
  belongs_to :choice_question

  validates :value, presence: true
  validates :is_correct, presence: true, numericality: { only_integer: true, in: 0..1 }

  delegate :question_text, to: :choice_question
end
