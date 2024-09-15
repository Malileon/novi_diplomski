class CreateQuizSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_sessions do |t|
      t.string :quiz_id
      t.references :user, foreign_key: true
      t.string :user_type, null: false
      t.string :guest_name

      t.timestamps
    end
  end
end
