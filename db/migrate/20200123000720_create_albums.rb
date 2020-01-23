class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
        t.column :name, :string
        t.column :description, :string
        t.column :user_id, :integer
    end
    add_foreign_key :albums, :users
  end
end
