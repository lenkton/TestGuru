class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.string :gist_hash, null: false
      t.references :creator, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
