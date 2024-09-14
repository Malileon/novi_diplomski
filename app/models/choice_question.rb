class ChoiceQuestion < ApplicationRecord
  include Questionable
  belongs_to :quiz
  has_many :choice, dependent: :destroy
  before_create :ensure_unique_id
  validates :question_text, presence: true

  def get_valid_choices(question)
    valid_choices = question.where(is_correct: "1")
  end

  private
  def ensure_unique_id
    self.id = nil  # Let the database assign the ID
  end
end
