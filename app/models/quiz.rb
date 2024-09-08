class Quiz < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :text_input_question, dependent: :destroy
  has_many :choice_question, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(name: :asc) }

  def get_questions(quiz, quiz_id)
    @questions = quiz.text_input_question.where(quiz_id: quiz_id)
    @questions += quiz.choice_question.where(quiz_id: quiz_id)
    @questions = @questions.sort_by{|obj| obj.created_at }
  end
end
