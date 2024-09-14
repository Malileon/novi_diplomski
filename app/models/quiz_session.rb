class QuizSession < ApplicationRecord
  belongs_to :quiz
  belongs_to :user, optional: true

  def evaluate(answers, quiz)
    points = 0

    quiz.get_questions(quiz).each_with_index do |question, index|
      puts question.get_type
      puts question.inspect
      puts "program"
      if question.get_type == "TextInputQuestion"
        points += 1 if question.answer.downcase == answers.fetch(answers.keys[index]).downcase.strip
      elsif question.get_type == "ChoiceQuestion"
        correct_choices = question.get_valid_choices(question.choice)

        question_points = 0
        point_value = 1.0 / correct_choices.count

        correct_ids = []
        correct_choices.each { |choice| correct_ids << choice.id }
        
        if answers.keys[index]
          answers.fetch(answers.keys[index]).each do |user_choice|
            correct_ids.include?(user_choice.to_i) ? question_points += point_value : question_points -= point_value
          end
        end

        question_points = 0 if question_points.negative?
        points += question_points
      end
    end
    points.round(2)
  end
end
