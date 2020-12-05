class CreateTestTakingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :test_taking_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
