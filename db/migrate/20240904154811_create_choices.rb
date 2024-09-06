class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :choice_question, null: false, foreign_key: true
      t.string :value, null: false
      t.boolean :is_correct, null: false

      t.timestamps
    end
  end
end
