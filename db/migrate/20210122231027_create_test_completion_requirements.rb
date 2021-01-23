class CreateTestCompletionRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :test_completion_requirements do |t|
      t.references :test, null: false
      t.references :condition, null: false

      t.timestamps
    end
  end
end
