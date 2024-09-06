class CreateChoiceQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :choice_questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :question_text, null: false

      t.timestamps
    end
  end
end
