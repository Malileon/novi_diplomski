class AddPointsToQuizSession < ActiveRecord::Migration[7.1]
  def change
    add_column :quiz_sessions, :points, :decimal, precision: 10, scale: 2, null: false
  end
end
