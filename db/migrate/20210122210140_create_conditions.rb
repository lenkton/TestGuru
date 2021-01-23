class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :type, index: true, null: false

      # for TriesCountCondition
      t.integer :tries_count

      t.timestamps
    end
  end
end
