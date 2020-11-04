class RenameImageColumnToTours < ActiveRecord::Migration[5.2]
  def change
    rename_column :tours, :image, :images
  end
end
