class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
        t.column :description, :string
        t.column :album_id, :integer
    end
    add_foreign_key :photos, :albums
  end
end
