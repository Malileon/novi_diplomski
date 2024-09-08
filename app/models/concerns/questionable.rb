module Questionable
  extend ActiveSupport::Concern

  def get_question_text
    self.question_text
  end

  def is_correct(user_answer)
    if self.class.name == "TextInputQuestion"
      puts "uso sam u if "
    elsif self.class.name == "ChoiceQuestion"
      puts "uso sam u Elsif"
    else
      puts "?"
    end
  end

  def get_type
    self.class.name
  end

  def get_choices
    #TODO: napravi choices model bla bla
  end

  def get_correct_answer
    #TODO: napravi choices model bla bla
  end
end