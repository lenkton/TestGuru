class ChangeColumnNullTestNameCategory < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :name, false
    change_column_null :tests, :category_id, false
  end
end
