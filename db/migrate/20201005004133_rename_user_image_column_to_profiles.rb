class RenameUserImageColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :user_image, :image
    rename_column :profiles, :user_profile, :body
  end
end
