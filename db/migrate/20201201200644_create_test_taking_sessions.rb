class CreateTestTakingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :test_taking_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }
      t.integer :correct_questions, null: false, default: 0
      t.boolean :success

      t.timestamps
    end
  end
end
