class ChangeColumnNullQuestionsTestText < ActiveRecord::Migration[6.0]
  def change
    change_column_null :questions, :test_id, false
    change_column_null :questions, :text, false
  end
end
