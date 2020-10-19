class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body
      t.float :rate, default: 0 #float型なのは少雨数い対応するため

      t.timestamps
    end
  end
end
