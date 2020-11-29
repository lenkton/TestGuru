class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.references :category, null: false
      t.integer :level, default: 0, null: false

      t.timestamps
    end
  end
end
