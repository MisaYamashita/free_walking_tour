class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :user_image
      t.text :user_profile

      t.timestamps
    end
  end
end
