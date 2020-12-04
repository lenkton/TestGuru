class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :author_id, null: false, foreign_key: true
      t.integer :level, default: 0, null: false

      t.timestamps
    end

    add_foreign_key :tests, :users, column: :author_id
  end
end
