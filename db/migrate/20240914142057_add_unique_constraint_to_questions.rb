class AddUniqueConstraintToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_index :choice_questions, [:id, :quiz_id], unique: true
    add_index :text_input_questions, [:id, :quiz_id], unique: true
    
    execute <<-SQL
      ALTER TABLE choice_questions
      ADD CONSTRAINT unique_choice_question_id
      UNIQUE (id);
      
      ALTER TABLE text_input_questions
      ADD CONSTRAINT unique_text_input_question_id
      UNIQUE (id);
      
      ALTER TABLE choice_questions
      ADD CONSTRAINT choice_question_id_not_quiz_id
      CHECK (id != quiz_id);
      
      ALTER TABLE text_input_questions
      ADD CONSTRAINT text_input_question_id_not_quiz_id
      CHECK (id != quiz_id);
    SQL
  end
end
