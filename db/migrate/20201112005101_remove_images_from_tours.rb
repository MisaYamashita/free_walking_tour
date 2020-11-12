class RemoveImagesFromTours < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :images, :json
  end
end
