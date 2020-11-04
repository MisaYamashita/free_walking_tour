class ChangeDatatypeImagesOfTours < ActiveRecord::Migration[5.2]
  def change
    change_column :tours, :images, :json
  end
end
