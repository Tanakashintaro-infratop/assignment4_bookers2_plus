class AddColumnsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :user_id, :integer
    add_column :favorites, :good, :boolean, default: false, null: false
  end
end
