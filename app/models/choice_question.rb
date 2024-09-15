class ChoiceQuestion < ApplicationRecord
  include Questionable
  belongs_to :quiz
  has_many :choice, dependent: :destroy
  before_create :ensure_unique_id
  validates :question_text, presence: true

  def get_valid_choices(choices)
    valid_choices = choices.where(is_correct: "1")
  end

  def get_choices
    self.choice
  end

  def get_correct_choices(property = "id")
    correct_choices = self.get_valid_choices(self.choice)
    correct_properties = []
    correct_choices.each { |choice| correct_properties << choice.id } if property == "id"
    correct_choices.each { |choice| correct_properties << choice.value } if property == "value"
    correct_properties
  end

  def all_correct(user_answers)
    user_correct = 0
    user_answers.each do |user_answer|
      if self.get_correct_choices.include?(user_answer.to_i)
        user_correct += 1
      end
    end

    correct_amount = self.get_correct_choices.count
    (user_correct == correct_amount and user_answers.count == correct_amount)
  end

  def get_user_values(user_answers)
    values = []
    self.choice.where(id: user_answers.fetch(self.id.to_s)).each { |choice| values << choice.value }
    values
  end

  private
  def ensure_unique_id
    self.id = nil
  end
end
