class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :image_url, null: false
      t.string :condition_type, null: false
      t.string :condition_parameter, null: false

      t.timestamps
    end
  end
end
