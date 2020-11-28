class ChangeColumnNullTestName < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :name, false
  end
end
