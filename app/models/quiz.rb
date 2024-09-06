class Quiz < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :text_input_question, dependent: :destroy
  has_many :choice_question, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(name: :asc) }
end
