class Quiz < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :text_input_question, dependent: :destroy
  has_many :choice_question, dependent: :destroy
  has_many :quiz_sessions

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :asc) }

  def get_questions(quiz)
    @questions = quiz.text_input_question.where(quiz_id: quiz.id)
    @questions += quiz.choice_question.where(quiz_id: quiz.id)
    @questions = @questions.sort_by{|obj| obj.created_at }
  end
end
