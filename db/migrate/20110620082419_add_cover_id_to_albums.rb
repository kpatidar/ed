class AddCoverIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :cover_photo_id, :integer
  end
end
