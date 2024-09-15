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

  def get_filled_questions_count
    empty = 0
    questions = self.choice_question.where(quiz_id: self.id)
    questions.each do |question|
      empty += 1 if question.choice.empty?
    end
    questions += self.text_input_question.where(quiz_id: self.id)
    questions.count - empty
  end
end
