class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :level, default: 0, null: false
      t.integer :time_limit
      t.index [:name, :level], unique: true

      t.timestamps
    end
  end
end
