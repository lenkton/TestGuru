class CreateRewardings < ActiveRecord::Migration[6.0]
  def change
    create_table :rewardings do |t|
      t.references :badge, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
