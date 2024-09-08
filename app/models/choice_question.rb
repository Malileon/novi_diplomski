class ChoiceQuestion < ApplicationRecord
  include Questionable
  belongs_to :quiz
  has_many :choice, dependent: :destroy
  
  validates :question_text, presence: true
end
