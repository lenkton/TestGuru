class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.references :question, null: false, foreign_key: true
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
