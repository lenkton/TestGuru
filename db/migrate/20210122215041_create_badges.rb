class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :image_url, null: false
      t.references :condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
