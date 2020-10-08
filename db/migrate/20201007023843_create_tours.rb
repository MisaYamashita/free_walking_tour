class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.integer :user_id
      t.text :title
      t.datetime :date
      t.string :image
      t.text :detail
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
