class ChangeDatatypeImagesOfTours < ActiveRecord::Migration[5.2]
  def change
    change_column :tours, :images, :json , 'json USING CAST(images AS json)'
  end
end