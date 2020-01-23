class AddPhotoParamsToUsers < ActiveRecord::Migration[5.2]
    def change
        add_column(:users, :profile_picture, :string)
        add_column(:users, :cover_photo, :string)
    end
end
