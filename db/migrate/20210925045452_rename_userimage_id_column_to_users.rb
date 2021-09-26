class RenameUserimageIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :userimage_id, :profile_image_id
  end
end
