class CreateTextInputQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :text_input_questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :question_text, null: false
      t.string :answer, null: false

      t.timestamps
    end
  end
end
