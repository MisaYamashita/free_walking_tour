class CreateTourContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_contacts do |t|
      t.references :tour, foreign_key: true
      t.string :name
      t.string :email
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
