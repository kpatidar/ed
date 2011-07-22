class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.string :album_description
      t.references :user

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
