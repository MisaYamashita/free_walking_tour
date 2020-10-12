class CreateUserTours < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tours do |t|
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
    add_index :user_tours, :user
    add_index :user_tours, :tour
    add_index :user_tours, [:user, :tour], unique: true
  end
end
