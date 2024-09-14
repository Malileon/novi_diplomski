class CreateQuizSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_sessions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :user_type, null: false
      t.string :guest_name

      t.timestamps
    end
  end
end
