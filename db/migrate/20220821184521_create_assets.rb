class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.integer :user_id
      t.string :cs_aset

      t.timestamps
    end
  end
end
